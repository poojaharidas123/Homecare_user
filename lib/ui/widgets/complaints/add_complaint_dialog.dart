import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homecare_user/values/values.dart';
import 'package:logger/logger.dart';

import '../../../blocs/complaint/complaint_bloc.dart';
import '../custom_button.dart';

class AddComplaintDialog extends StatefulWidget {
  final int requestId;
  const AddComplaintDialog({
    super.key,
    required this.requestId,
  });

  @override
  State<AddComplaintDialog> createState() => _AddComplaintDialogState();
}

class _AddComplaintDialogState extends State<AddComplaintDialog> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController complaintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Send your complaint",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 3,
                minLines: 3,
                controller: complaintController,
                validator: (value) {
                  if (value != null && value.trim().isNotEmpty) {
                    return null;
                  } else {
                    return 'Please enter a complaint';
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Complaint",
                  prefixIcon: Icon(
                    Icons.warning,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      textColor: primaryColor,
                      buttonColor: secondaryColor,
                      label: 'Cancel',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(
                      label: 'Send',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ComplaintBloc().add(
                            AddComplaintEvent(
                              complaint: complaintController.text.trim(),
                              requestId: widget.requestId,
                            ),
                          );

                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
