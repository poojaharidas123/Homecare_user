import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  final Function() onPressed;
  const CustomAddButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(45),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
