import 'package:flutter/material.dart';
import 'package:untitled/src/config/theme/color_manager.dart';

class StatusWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  final double containerRadius;
  final Color backgroundColor;
  final Color labelColor;

  const StatusWidget({
    Key? key,
    required this.label,
    required this.labelColor,
    this.containerRadius = 8,
    this.backgroundColor = ColorManager.white,
    this.fontSize = 13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(containerRadius),
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: labelColor),
        ),
      ),
    );
  }
}
