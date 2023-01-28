import 'package:flutter/material.dart';

class CustomDateAndTime extends StatelessWidget {
  const CustomDateAndTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Start",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 130,
              height: 30,
              child: Material(
                color: Color.fromARGB(255, 243, 244, 241),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45)),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "End",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 130,
              height: 30,
              child: Material(
                color: Color.fromARGB(255, 242, 243, 240),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
