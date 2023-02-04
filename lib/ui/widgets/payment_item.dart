import 'package:flutter/material.dart';
import 'package:homecare_user/ui/widgets/custom_button.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Row(
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
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          "Dharshana M",
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("January"),
                            SizedBox(
                              width: 10,
                            ),
                            Text("(2022)"),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('10 to 25'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.currency_rupee,
                              color: Colors.black,
                              size: 15,
                            ),
                            Text('15000'),
                          ],
                        ),
                        SizedBox(height: 6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              label: "Paynow",
              onPressed: () {},
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
