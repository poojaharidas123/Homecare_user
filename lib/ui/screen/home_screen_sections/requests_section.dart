import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:homecare_user/ui/widgets/custom_button.dart';

class RequestSection extends StatelessWidget {
  const RequestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 100,
          ),
          itemBuilder: (context, index) => RequestItem(),
          itemCount: 10,
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 80,
              right: 20,
            ),
            child: SizedBox(
              width: 130,
              child: CustomButton(
                label: 'Request',
                iconData: Icons.add_circle_outline_outlined,
                onPressed: () {},
              ),
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
      borderRadius: BorderRadius.circular(45),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text('11/11/2022'),
                SizedBox(
                  width: 230,
                ),
                Text('pending'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    "https://amritammu.com/wp-content/uploads/2020/04/Newborn-Baby-Photoshoot-Amrit-Ammu-Photography-90.jpg",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15),
                Column(children: [
                  Text(
                    'Krithya M P',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('5 months'),
                      SizedBox(
                        width: 5,
                      ),
                      Text('F'),
                    ],
                  )
                ])
              ],
            ),
            Divider(),
            Row(
              children: [
                Text('Date Range :'),
                SizedBox(
                  width: 5,
                ),
                Text('01/03/2023'),
                SizedBox(
                  width: 5,
                ),
                Text('-'),
                SizedBox(
                  width: 5,
                ),
                Text('31/03/2023'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Time Range :'),
                SizedBox(
                  width: 5,
                ),
                Text('01:00 PM'),
                SizedBox(
                  width: 5,
                ),
                Text('-'),
                SizedBox(
                  width: 5,
                ),
                Text('04:00 PM'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
