import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:homecare_user/ui/widgets/custom_button.dart';
import 'package:homecare_user/ui/widgets/label_with_text.dart';

class RequestSection extends StatelessWidget {
  const RequestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CupertinoSlidingSegmentedControl<String>(
          children: const {
            'active': Text('Active'),
            'pending': Text('Pending'),
            'rejected': Text('Rejected'),
          },
          onValueChanged: (status) {},
          groupValue: 'active',
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 100,
            ),
            itemBuilder: (context, index) => RequestItem(),
            itemCount: 10,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          ),
        ),
      ],
    );
  }
}

class RequestItem extends StatelessWidget {
  const RequestItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#1231231',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                ),
                Text(
                  'pending',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Krithya M P',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              '10 female',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date Range :',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black45,
                      ),
                ),
                const SizedBox(width: 5),
                Text(
                  '01/03/2023 to 01/05/2023',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time Range :',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black45,
                      ),
                ),
                const SizedBox(width: 5),
                Text(
                  '10:00 AM to 05:00 PM',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                LabelWithText(
                  label: 'Assigned Nurse',
                  text: 'Nurse Name',
                ),
                SizedBox(width: 5),
                LabelWithText(
                  alignment: CrossAxisAlignment.end,
                  label: 'Age & Gender',
                  text: '30 female',
                ),
              ],
            ),
            const Divider(),
            Text(
              'Reason',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.black45,
                  ),
            ),
            const SizedBox(height: 2.5),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                LabelWithText(
                  label: 'Total Fee',
                  text: '10000',
                ),
                SizedBox(width: 5),
                LabelWithText(
                  alignment: CrossAxisAlignment.end,
                  label: 'Paid',
                  text: '5000',
                ),
              ],
            ),
            const Divider(),
            CustomButton(
              label: 'Make Payment',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
