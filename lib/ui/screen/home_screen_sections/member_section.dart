import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homecare_user/blocs/manage_patients/manage_patients_bloc.dart';
import 'package:homecare_user/ui/widgets/custom_alert_dialog.dart';
import 'package:homecare_user/ui/widgets/gender_selector.dart';
import 'package:homecare_user/util/value_validators.dart';
import 'package:homecare_user/values/values.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_add_button.dart';
import '../../widgets/custom_patient_card.dart';

class MemberSection extends StatefulWidget {
  const MemberSection({super.key});

  @override
  State<MemberSection> createState() => _MemberSectionState();
}

class _MemberSectionState extends State<MemberSection> {
  final ManagePatientsBloc managePatientsBloc = ManagePatientsBloc();

  @override
  void initState() {
    super.initState();
    managePatientsBloc.add(GetAllPatientsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManagePatientsBloc>.value(
      value: managePatientsBloc,
      child: BlocConsumer<ManagePatientsBloc, ManagePatientsState>(
        listener: (context, state) {
          if (state is ManagePatientsFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                message: state.message,
                primaryButtonLabel: 'Retry',
                primaryOnPressed: () {
                  managePatientsBloc.add(GetAllPatientsEvent());
                },
              ),
            );
          }
        },
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 100,
            ),
            children: [
              state is ManagePatientsSuccessState
                  ? state.patients.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => PatientCard(
                            patientDetails: state.patients[index],
                            managePatientsBloc: managePatientsBloc,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: state.patients.length,
                        )
                      : const Center(
                          child: Text(
                            'No Members found',
                          ),
                        )
                  : const Padding(
                      padding: EdgeInsets.all(100),
                      child: CupertinoActivityIndicator(),
                    ),
              const SizedBox(height: 15),
              CustomAddButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => MemberForm(
                      managePatientsBloc: managePatientsBloc,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class MemberForm extends StatefulWidget {
  final ManagePatientsBloc managePatientsBloc;
  final Map<String, dynamic>? patientDetails;
  const MemberForm({
    super.key,
    required this.managePatientsBloc,
    this.patientDetails,
  });

  @override
  State<MemberForm> createState() => _MemberFormState();
}

class _MemberFormState extends State<MemberForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String gender = 'male';
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _dobC = TextEditingController();
  final TextEditingController _addressC = TextEditingController();
  final TextEditingController _conditionC = TextEditingController();

  List<dynamic> medications = [];

  @override
  void initState() {
    super.initState();
    if (widget.patientDetails != null) {
      medications = widget.patientDetails!['medications'];
      gender = widget.patientDetails!['gender'];
      _nameC.text = widget.patientDetails!['name'];
      _phoneC.text = widget.patientDetails!['phone'];
      _dobC.text = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(widget.patientDetails!['dob']));
      _addressC.text = widget.patientDetails!['address'];
      _conditionC.text = widget.patientDetails!['conditions'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      backgroundColor: secondaryColor,
      title: 'Member',
      message: 'Update the member details and save.',
      content: Expanded(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _nameC,
                validator: alphaNumericValidator,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(
                    Icons.person_outline,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GenderSelector(
                selected: gender,
                onSelect: (g) {
                  gender = g;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneC,
                validator: phoneValidator,
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  prefixIcon: Icon(
                    Icons.phone_outlined,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _dobC,
                readOnly: true,
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1970),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (date != null) {
                    _dobC.text = DateFormat('yyyy-MM-dd').format(date);
                    setState(() {});
                  }
                },
                validator: (d) {
                  if (d != null && d.isNotEmpty) {
                    return null;
                  } else {
                    return 'Select Date to Continue';
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Date of Birth',
                  prefixIcon: Icon(
                    Icons.date_range,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                minLines: 3,
                maxLines: 4,
                controller: _addressC,
                validator: alphaNumericValidator,
                decoration: const InputDecoration(
                  hintText: 'Address',
                  prefixIcon: Icon(
                    Icons.home,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                minLines: 3,
                maxLines: 4,
                controller: _conditionC,
                validator: alphaNumericValidator,
                decoration: const InputDecoration(
                  hintText: 'Conditions',
                  prefixIcon: Icon(
                    Icons.list,
                  ),
                ),
              ),
              const Divider(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Medications'),
                ],
              ),
              const SizedBox(height: 10),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            medications[index]['medicine'],
                          ),
                        ),
                        Text(medications[index]['timing']),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            medications.removeAt(index);
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: medications.length,
              ),
              const SizedBox(height: 10),
              CustomAddButton(
                onPressed: () async {
                  TextEditingController _medicineC = TextEditingController();
                  TextEditingController _timingC = TextEditingController();
                  await showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      title: 'Medication',
                      message:
                          "Enter medicine name and timing. eg. Name : Dolo, Timing : 1-0-0-0",
                      content: Column(
                        children: [
                          TextFormField(
                            controller: _medicineC,
                            decoration: const InputDecoration(
                              hintText: 'Medicine',
                              prefixIcon: Icon(
                                Icons.medical_information_outlined,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _timingC,
                            decoration: const InputDecoration(
                              hintText: 'Timing',
                              prefixIcon: Icon(
                                Icons.alarm,
                              ),
                            ),
                          ),
                        ],
                      ),
                      primaryButtonLabel: 'Add',
                      primaryOnPressed: () {
                        if (_medicineC.text.trim().isNotEmpty &&
                            _timingC.text.trim().isNotEmpty) {
                          medications.add({
                            'medicine': _medicineC.text.trim(),
                            'timing': _timingC.text.trim()
                          });
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (c) => const CustomAlertDialog(
                              title: 'Enter Medication',
                              message: 'Enter medicine and timing to continue',
                              primaryButtonLabel: 'Ok',
                            ),
                          );
                        }
                      },
                    ),
                  );
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
      primaryButtonLabel: 'Save',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          if (widget.patientDetails != null) {
            widget.managePatientsBloc.add(
              EditPatientEvent(
                patientId: widget.patientDetails!['id'],
                name: _nameC.text.trim(),
                medications: medications,
                dob: _dobC.text.trim(),
                gender: gender,
                phone: _phoneC.text.trim(),
                address: _addressC.text.trim(),
                condition: _conditionC.text.trim(),
              ),
            );
          } else {
            widget.managePatientsBloc.add(
              AddPatientEvent(
                name: _nameC.text.trim(),
                medications: medications,
                dob: _dobC.text.trim(),
                gender: gender,
                phone: _phoneC.text.trim(),
                address: _addressC.text.trim(),
                condition: _conditionC.text.trim(),
              ),
            );
          }
          Navigator.pop(context);
        }
      },
    );
  }
}
