import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final BorderRadius? borderRadius;
  final IconData? iconData;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.borderRadius,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFAAD013),
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
                      color: Colors.white,
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
                        color: Colors.white,
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
