import 'package:flutter/material.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F3DF),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset("assets/images/logo.png")
              ),
            ),
            Text(
              "Verify",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter the OTP to continue",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 10,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(45))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Material(
              color: Color(0xFFAAD013),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Continue"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "By signing in you agree to our terms and conditions and privacy policy"),
          ],
        ),
      ),
    );
  }
}
