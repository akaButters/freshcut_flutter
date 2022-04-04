import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double cornerRadius;
  final Color? glowColor;
  final double? glowRadius;

  const ProgressBar({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.cornerRadius,
    this.glowColor,
    this.glowRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,

          borderRadius: BorderRadius.all(
            Radius.circular(cornerRadius),
          ),

          // outer glow
          boxShadow: [
            if (glowColor != null && glowRadius != null)
              BoxShadow (
                color: glowColor!,
                blurRadius: glowRadius!,
              ),
          ],
        ),
      );
    }
}

