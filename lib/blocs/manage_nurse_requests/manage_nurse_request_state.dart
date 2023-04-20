part of 'manage_nurse_request_bloc.dart';

@immutable
abstract class ManageNurseRequestState {}

class ManageNurseRequestInitialState extends ManageNurseRequestState {}

class ManageNurseRequestLoadingState extends ManageNurseRequestState {}

class ManageNurseRequestSuccessState extends ManageNurseRequestState {
  final List<dynamic> requests;

  ManageNurseRequestSuccessState({required this.requests});
}

class ManageNurseRequestFailureState extends ManageNurseRequestState {
  final String message;

  ManageNurseRequestFailureState({
    this.message =
        'Something went wrong, Please check your connection and try again!.',
  });
}
