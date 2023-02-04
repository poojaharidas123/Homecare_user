import 'package:flutter/material.dart';

import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_patient_card.dart';

class MemberSection extends StatelessWidget {
  const MemberSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      children: [
        PatientCard(),
        SizedBox(height: 15),
        CustomIconButton(),
      ],
    );
  }
}
