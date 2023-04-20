import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignUpLoadingState());

      SupabaseClient supabaseClient = Supabase.instance.client;

      try {
        if (event is GetUserEvent) {
          Map<String, dynamic>? profile = await supabaseClient
              .from('profiles')
              .select('*')
              .eq(
                'user_id',
                supabaseClient.auth.currentUser!.id,
              )
              .maybeSingle();

          await supabaseClient.auth.refreshSession();

          if (profile != null) {
            emit(
              SignUpSuccessState(
                userDetails: profile,
              ),
            );
          } else {
            emit(SignUpFailureState());
          }
        } else if (event is CreateUserEvent) {
          UserResponse res = await supabaseClient.auth.admin.createUser(
            AdminUserAttributes(
              email: event.email,
              phone: event.phoneNumber,
              password: event.password,
              emailConfirm: true,
              phoneConfirm: true,
            ),
          );

          if (res.user != null) {
            await supabaseClient.from('profiles').insert({
              'name': event.name,
              'phone_number': event.phoneNumber,
              'user_id': res.user!.id,
            });
            await supabaseClient.auth.signInWithPassword(
              email: event.email,
              password: event.password,
            );
            add(GetUserEvent());
          } else {
            emit(SignUpFailureState());
          }
        } else if (event is UpdateUserEvent) {
          AdminUserAttributes attributes = AdminUserAttributes(
            email: event.email,
            phone: event.phoneNumber,
            emailConfirm: true,
            phoneConfirm: true,
          );

          if (event.password.isNotEmpty) {
            attributes.password = event.password;
          }

          UserResponse res = await supabaseClient.auth.admin.updateUserById(
            supabaseClient.auth.currentUser!.id,
            attributes: attributes,
          );

          if (res.user != null) {
            await supabaseClient.from('profiles').update({
              'name': event.name,
              'phone_number': event.phoneNumber,
            }).eq('user_id', res.user!.id);

            add(GetUserEvent());
          } else {
            emit(SignUpFailureState());
          }
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(SignUpFailureState(message: e.toString()));
      }
    });
  }
}
