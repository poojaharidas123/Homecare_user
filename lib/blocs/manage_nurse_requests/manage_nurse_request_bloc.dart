import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manage_nurse_request_event.dart';
part 'manage_nurse_request_state.dart';

class ManageNurseRequestBloc
    extends Bloc<ManageNurseRequestEvent, ManageNurseRequestState> {
  ManageNurseRequestBloc() : super(ManageNurseRequestInitialState()) {
    on<ManageNurseRequestEvent>((event, emit) async {
      emit(ManageNurseRequestLoadingState());
      try {
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder nurseRequestsTable =
            supabaseClient.from('nurse_requests');
        SupabaseQueryBuilder paymentTable =
            supabaseClient.from('nurse_request_payments');

        if (event is GetAllNurseRequestEvent) {
          List<dynamic> nurseRequests = await supabaseClient.rpc(
            'get_nurse_requests',
            params: {
              'search_status': event.status,
              'search_user_id': supabaseClient.auth.currentUser!.id,
            },
          );

          emit(ManageNurseRequestSuccessState(requests: nurseRequests));
        } else if (event is AddNurseRequestEvent) {
          await nurseRequestsTable.insert(
            {
              'user_id': supabaseClient.auth.currentUser!.id,
              'patient_id': event.patientId,
              'date_start': event.dateFrom,
              'date_end': event.dateTo,
              'time_start': event.timeFrom,
              'time_end': event.timeTo,
            },
          );
          add(GetAllNurseRequestEvent());
        } else if (event is DeleteNurseRequestEvent) {
          await nurseRequestsTable.delete().eq('id', event.requestId);
          add(GetAllNurseRequestEvent());
        } else if (event is PayNurseRequestEvent) {
          await paymentTable.insert(
            {
              'nurse_request_id': event.requestId,
              'amount': event.amount,
            },
          );
          add(GetAllNurseRequestEvent(status: 'active'));
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ManageNurseRequestFailureState(message: e.toString()));
      }
    });
  }
}
