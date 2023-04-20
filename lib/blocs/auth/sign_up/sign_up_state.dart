part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final Map<String, dynamic> userDetails;

  SignUpSuccessState({required this.userDetails});
}

class SignUpFailureState extends SignUpState {
  final String message;

  SignUpFailureState({
    this.message =
        'Something went wrong, Please check your connection and try again!.',
  });
}
