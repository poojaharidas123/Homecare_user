import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manage_patients_event.dart';
part 'manage_patients_state.dart';

class ManagePatientsBloc
    extends Bloc<ManagePatientsEvent, ManagePatientsState> {
  ManagePatientsBloc() : super(ManagePatientsInitialState()) {
    on<ManagePatientsEvent>((event, emit) async {
      emit(ManagePatientsLoadingState());

      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('patients');

      try {
        if (event is GetAllPatientsEvent) {
          List<dynamic> temp = await queryTable
              .select('*')
              .eq(
                'user_id',
                supabaseClient.auth.currentUser!.id,
              )
              .order(
                'name',
                ascending: true,
              );

          List<Map<String, dynamic>> patients =
              temp.map((e) => e as Map<String, dynamic>).toList();

          emit(ManagePatientsSuccessState(patients: patients));
        } else if (event is AddPatientEvent) {
          await supabaseClient.from('patients').insert({
            'user_id': supabaseClient.auth.currentUser!.id,
            'name': event.name,
            'gender': event.gender,
            'address': event.address,
            'phone': event.phone,
            'dob': event.dob,
            'conditions': event.condition,
            'medications': event.medications,
          });
          add(GetAllPatientsEvent());
        } else if (event is EditPatientEvent) {
          await supabaseClient.from('patients').update({
            'name': event.name,
            'gender': event.gender,
            'address': event.address,
            'phone': event.phone,
            'dob': event.dob,
            'conditions': event.condition,
            'medications': event.medications,
          }).eq('id', event.patientId);
          add(GetAllPatientsEvent());
        } else if (event is DeletePatientEvent) {
          await supabaseClient
              .from('patients')
              .delete()
              .eq('id', event.patientId);
          add(GetAllPatientsEvent());
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ManagePatientsFailureState(message: e.toString()));
      }
    });
  }
}
