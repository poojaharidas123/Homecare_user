import 'package:flutter/material.dart';

class BottomNavBarButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Function() onPressed;
  final bool isSelected;
  const BottomNavBarButton({
    Key? key,
    required this.iconData,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            Icon(
              iconData,
              color: isSelected ? Colors.green : Colors.black54,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.green : Colors.black54,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
