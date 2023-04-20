part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class CreateUserEvent extends SignUpEvent {
  final String name, email, phoneNumber, password;

  CreateUserEvent({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}

class UpdateUserEvent extends SignUpEvent {
  final String name, email, phoneNumber, password;

  UpdateUserEvent({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}

class GetUserEvent extends SignUpEvent {}
