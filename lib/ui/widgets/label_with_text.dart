import 'package:flutter/material.dart';

class LabelWithText extends StatelessWidget {
  final String label, text;
  final CrossAxisAlignment alignment;
  const LabelWithText({
    super.key,
    required this.label,
    required this.text,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.black45,
              ),
        ),
        const SizedBox(height: 2.5),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
