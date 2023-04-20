import 'package:flutter/material.dart';

import '../../values/values.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final BorderRadius? borderRadius;
  final IconData? iconData;
  final Color? buttonColor, textColor;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.borderRadius,
    this.iconData,
    this.buttonColor = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: borderRadius ?? BorderRadius.circular(45),
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(45),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Row(
            children: [
              iconData != null
                  ? Icon(
                      iconData,
                      size: 20,
                      color: textColor,
                    )
                  : SizedBox(),
              SizedBox(
                width: iconData != null ? 15 : 0,
              ),
              Expanded(
                child: Text(
                  label,
                  textAlign:
                      iconData != null ? TextAlign.start : TextAlign.center,
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: textColor,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
