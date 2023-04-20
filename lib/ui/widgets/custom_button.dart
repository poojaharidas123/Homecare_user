import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final BorderRadius? borderRadius;
  final IconData? iconData;
  final Color? buttonColor, textColor;
  final EdgeInsets? padding;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.borderRadius,
    this.buttonColor,
    this.iconData,
    this.textColor = Colors.white,
    this.padding,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor ?? const Color(0xFFAAD013),
      borderRadius: borderRadius ?? BorderRadius.circular(45),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(45),
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
          child: isLoading
              ? const SizedBox(
                  child: CupertinoActivityIndicator(),
                )
              : Row(
                  children: [
                    iconData != null
                        ? Icon(
                            iconData,
                            size: 20,
                            color: Colors.white,
                          )
                        : const SizedBox(),
                    SizedBox(
                      width: iconData != null ? 15 : 0,
                    ),
                    Expanded(
                      child: Text(
                        label,
                        textAlign: iconData != null
                            ? TextAlign.start
                            : TextAlign.center,
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
