import 'package:flutter/material.dart';
import 'package:homecare_user/blocs/manage_patients/manage_patients_bloc.dart';
import 'package:homecare_user/ui/widgets/custom_icon_button.dart';
import 'package:homecare_user/util/get_age.dart';

import '../screen/home_screen_sections/member_section.dart';
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
