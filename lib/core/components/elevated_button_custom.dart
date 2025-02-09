import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final Color? backgroundColor;
  final Color? fontColor;
  final String? imagePath;
  final String text;
  final void Function() onLoginClick;
  final TextStyle style;
  const ElevatedButtonCustom({
    super.key,
    this.backgroundColor,
    this.fontColor,
    this.imagePath,
    required this.text,
    required this.onLoginClick,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLoginClick,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null) ...[
              Image.asset(
                imagePath!,
                height: 24,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: fontColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
