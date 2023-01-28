import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 246, 247, 245),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(45),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.black,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
