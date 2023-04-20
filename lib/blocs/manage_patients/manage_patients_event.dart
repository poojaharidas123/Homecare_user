part of 'manage_patients_bloc.dart';

@immutable
abstract class ManagePatientsEvent {}

class GetAllPatientsEvent extends ManagePatientsEvent {
  final String? query;

  GetAllPatientsEvent({this.query});
}

class AddPatientEvent extends ManagePatientsEvent {
  final String name, gender, phone, dob, address, condition;
  final List<dynamic> medications;

  AddPatientEvent({
    required this.name,
    required this.medications,
    required this.dob,
    required this.gender,
    required this.phone,
    required this.address,
    required this.condition,
  });
}

class EditPatientEvent extends ManagePatientsEvent {
  final String name, gender, phone, dob, address, condition;
  final int patientId;
  final List<dynamic> medications;

  EditPatientEvent({
    required this.patientId,
    required this.name,
    required this.medications,
    required this.dob,
    required this.gender,
    required this.phone,
    required this.address,
    required this.condition,
  });
}

class DeletePatientEvent extends ManagePatientsEvent {
  final int patientId;

  DeletePatientEvent({
    required this.patientId,
  });
}
