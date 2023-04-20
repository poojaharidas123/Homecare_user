import 'package:flutter/material.dart';

class DrawerButton extends StatefulWidget {
  final String label;
  final IconData iconData;
  final bool isSelected;
  final Function() onPressed;
  const DrawerButton({
    Key? key,
    required this.label,
    this.isSelected = false,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  @override
  State<DrawerButton> createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(
          width: 1,
          color: Colors.black12,
        ),
      ),
      // color: (widget.isSelected || !_hover)
      //     ? Colors.white
      //     : Colors.black12.withOpacity(.1),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 15,
            right: 15,
          ),
          child: Row(
            children: [
              Icon(
                widget.iconData,
                color: Colors.green,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  widget.label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
