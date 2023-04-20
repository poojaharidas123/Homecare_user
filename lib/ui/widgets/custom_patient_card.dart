import 'package:flutter/material.dart';

import 'custom_card.dart';
import 'label_with_text.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
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
              Text(
                '#UserId',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Krithya M P',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                '20 Female',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              const SizedBox(
                height: 15,
              ),
              const LabelWithText(
                label: 'Phone No',
                text: '9876765654',
              ),
              const SizedBox(
                height: 10,
              ),
              const LabelWithText(
                label: 'Email',
                text: 'someemail@gmail.com',
              ),
              const SizedBox(
                height: 10,
              ),
              const LabelWithText(
                label: 'Address',
                text: 'Xyz house, P.O Pallikkunnu,Kannur',
              ),
              const SizedBox(
                height: 10,
              ),
              const LabelWithText(
                label: 'Conditions',
                text: 'Some Conditions',
              ),
              const Divider(height: 30),
              const Text(
                'Medications',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Some Medication',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '0-1-0-0',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Some Medication',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '0-1-0-0',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
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
