import 'package:flutter/material.dart';
import 'package:homecare_user/ui/screen/home_screen_sections/requests_section.dart';
import 'package:homecare_user/ui/widgets/custom_card.dart';
import 'package:intl/intl.dart';

import '../../../blocs/complaint/complaint_bloc.dart';
import '../custom_alert_dialog.dart';
import '../custom_button.dart';
import '../custom_icon_button.dart';

class ComplaintCard extends StatelessWidget {
  final Map<String, dynamic> complaintDetails;
  final ComplaintBloc complaintBloc;
  const ComplaintCard({
    super.key,
    required this.complaintDetails,
    required this.complaintBloc,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('dd/MM/yyyy').format(DateTime.parse(
                      complaintDetails['complaint']['created_at'])),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
                CustomIconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        title: 'Are you sure',
                        message:
                            'Are you sure you want to delete this complaint? This action cannot be undone',
                        primaryButtonLabel: 'Delete',
                        primaryOnPressed: () {
                          complaintBloc.add(
                            DeleteComplaintEvent(
                              complaintId: complaintDetails['complaint']['id'],
                            ),
                          );

                          Navigator.pop(context);
                        },
                        secondaryButtonLabel: 'Cancel',
                        secondaryOnPressed: () => Navigator.pop(context),
                      ),
                    );
                  },
                  iconData: Icons.delete_forever_outlined,
                  color: Colors.red,
                ),
              ],
            ),
            const Divider(
              color: Colors.black38,
            ),
            Text(
              complaintDetails['complaint']['complaint'],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Divider(
              color: Colors.black38,
            ),
            CustomButton(
              label: 'Request Details',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => RequestItem(
                    requestDetails: complaintDetails['request'],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
