import 'package:flutter/material.dart';
import 'package:homecare_user/ui/screen/selectmember_screen.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          PatientCard(),
          SizedBox(height: 20),
          CustomIconButton(),
        ],
      ),
    ));
  }
}
