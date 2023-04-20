import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homecare_user/blocs/manage_nurse_requests/manage_nurse_request_bloc.dart';
import 'package:homecare_user/blocs/manage_patients/manage_patients_bloc.dart';
import 'package:homecare_user/ui/widgets/custom_icon_button.dart';
import 'package:homecare_user/util/format_time_of_day.dart';
import 'package:homecare_user/util/get_age.dart';
import 'package:homecare_user/values/values.dart';
import 'package:intl/intl.dart';

import '../screen/home_screen_sections/member_section.dart';
import 'custom_alert_dialog.dart';
import 'custom_card.dart';
import 'label_with_text.dart';

class PatientCard extends StatelessWidget {
  final ManagePatientsBloc managePatientsBloc;
  final Map<String, dynamic> patientDetails;
  const PatientCard({
    super.key,
    required this.managePatientsBloc,
    required this.patientDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: SizedBox(
        width: 320,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '#${patientDetails['id'].toString()}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  CustomIconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddNurseRequestDialog(
                          patientDetails: patientDetails,
                        ),
                      );
                    },
                    iconData: Icons.add_circle_outline,
                    color: primaryColor,
                  ),
                  const SizedBox(width: 15),
                  CustomIconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => MemberForm(
                          managePatientsBloc: managePatientsBloc,
                          patientDetails: patientDetails,
                        ),
                      );
                    },
                    iconData: Icons.edit_outlined,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 15),
                  CustomIconButton(
                    onPressed: () {
                      managePatientsBloc.add(
                          DeletePatientEvent(patientId: patientDetails['id']));
                    },
                    iconData: Icons.delete_forever_outlined,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                patientDetails['name'],
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                '${getAge(DateTime.parse(patientDetails['dob']))} ${patientDetails['gender']}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              const SizedBox(
                height: 15,
              ),
              LabelWithText(
                label: 'Phone No',
                text: patientDetails['phone'],
              ),
              const SizedBox(
                height: 10,
              ),
              LabelWithText(
                label: 'Address',
                text: patientDetails['address'],
              ),
              const SizedBox(
                height: 10,
              ),
              LabelWithText(
                label: 'Conditions',
                text: patientDetails['conditions'],
              ),
              if (patientDetails['medications'].isNotEmpty)
                const Divider(height: 30),
              if (patientDetails['medications'].isNotEmpty)
                const Text(
                  'Medications',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              if (patientDetails['medications'].isNotEmpty)
                const SizedBox(
                  height: 2.5,
                ),
              if (patientDetails['medications'].isNotEmpty)
                ...List<Widget>.generate(
                  patientDetails['medications'].length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          patientDetails['medications'][index]['medicine'],
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          patientDetails['medications'][index]['timing'],
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddNurseRequestDialog extends StatefulWidget {
  final Map<String, dynamic> patientDetails;
  const AddNurseRequestDialog({
    super.key,
    required this.patientDetails,
  });

  @override
  State<AddNurseRequestDialog> createState() => _AddNurseRequestDialogState();
}

class _AddNurseRequestDialogState extends State<AddNurseRequestDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _dateFromC = TextEditingController();
  final TextEditingController _dateToC = TextEditingController();
  final TextEditingController _timeFromC = TextEditingController();
  final TextEditingController _timeToC = TextEditingController();
  String _timeFrom = '', _timeTo = '';
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Request',
      message: 'Enter the following details to add a nurse request',
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelWithText(
              label: 'For',
              text: widget.patientDetails['name'],
            ),
            const Divider(
              height: 20,
            ),
            TextFormField(
              controller: _dateFromC,
              readOnly: true,
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(
                    const Duration(
                      days: 7,
                    ),
                  ),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );

                if (date != null) {
                  _dateFromC.text = DateFormat('yyyy-MM-dd').format(date);
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
                hintText: 'Date From',
                prefixIcon: Icon(
                  Icons.date_range,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _dateToC,
              readOnly: true,
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(
                    const Duration(
                      days: 7,
                    ),
                  ),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );

                if (date != null) {
                  _dateToC.text = DateFormat('yyyy-MM-dd').format(date);
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
                hintText: 'Date To',
                prefixIcon: Icon(
                  Icons.date_range,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _timeFromC,
              readOnly: true,
              onTap: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(
                    hour: 0,
                    minute: 0,
                  ),
                );

                if (time != null) {
                  _timeFromC.text = time.format(context);
                  _timeFrom = formatTimeOfDay(time);
                  setState(() {});
                }
              },
              validator: (d) {
                if (d != null && d.isNotEmpty) {
                  return null;
                } else {
                  return 'Select Time to Continue';
                }
              },
              decoration: const InputDecoration(
                hintText: 'Time From',
                prefixIcon: Icon(
                  Icons.alarm_outlined,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _timeToC,
              readOnly: true,
              onTap: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(
                    hour: 0,
                    minute: 0,
                  ),
                );

                if (time != null) {
                  _timeToC.text = time.format(context);
                  _timeTo = formatTimeOfDay(time);

                  setState(() {});
                }
              },
              validator: (d) {
                if (d != null && d.isNotEmpty) {
                  return null;
                } else {
                  return 'Select Time to Continue';
                }
              },
              decoration: const InputDecoration(
                hintText: 'Time To',
                prefixIcon: Icon(
                  Icons.alarm_outlined,
                ),
              ),
            ),
          ],
        ),
      ),
      primaryButtonLabel: 'Add',
      primaryOnPressed: () {
        //
        if (formKey.currentState!.validate()) {
          bool isDateAfter = DateTime.parse(_dateToC.text)
              .isAfter(DateTime.parse(_dateFromC.text));

          bool isTimeAfter = DateTime.parse('2000-10-10 $_timeTo')
              .isAfter(DateTime.parse('2000-10-10 $_timeFrom'));

          if (isDateAfter && isTimeAfter) {
            BlocProvider.of<ManageNurseRequestBloc>(context).add(
              AddNurseRequestEvent(
                patientId: widget.patientDetails['id'],
                dateFrom: _dateFromC.text.trim(),
                dateTo: _dateToC.text.trim(),
                timeFrom: _timeFrom,
                timeTo: _timeTo,
              ),
            );
            Navigator.pop(context);
          } else {
            showDialog(
              context: context,
              builder: (context) => const CustomAlertDialog(
                title: 'Invalid',
                message:
                    'Date to must be after Date from and time to must be after time from',
                primaryButtonLabel: 'Ok',
              ),
            );
          }
        }
      },
    );
  }
}
