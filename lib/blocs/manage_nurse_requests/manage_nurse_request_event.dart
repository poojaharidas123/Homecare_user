part of 'manage_nurse_request_bloc.dart';

@immutable
abstract class ManageNurseRequestEvent {}

class GetAllNurseRequestEvent extends ManageNurseRequestEvent {
  final String? status;

  GetAllNurseRequestEvent({this.status = 'pending'});
}

class AddNurseRequestEvent extends ManageNurseRequestEvent {
  final int patientId;
  final String dateFrom, dateTo, timeFrom, timeTo;

  AddNurseRequestEvent({
    required this.patientId,
    required this.dateFrom,
    required this.dateTo,
    required this.timeFrom,
    required this.timeTo,
  });
}

class DeleteNurseRequestEvent extends ManageNurseRequestEvent {
  final int requestId;

  DeleteNurseRequestEvent({
    required this.requestId,
  });
}

class PayNurseRequestEvent extends ManageNurseRequestEvent {
  final int requestId, amount;

  PayNurseRequestEvent({
    required this.requestId,
    required this.amount,
  });
}
