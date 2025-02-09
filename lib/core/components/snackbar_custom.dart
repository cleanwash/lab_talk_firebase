import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab_talk_firebase/core/theme/palette.dart';

enum SnackBarType { success, error, warning, info }

void showSnackBarCustom(
  BuildContext context,
  String text, {
  SnackBarType type = SnackBarType.success,
  int duration = 2,
}) {
  final icon = switch (type) {
    SnackBarType.success => Icons.check_circle,
    SnackBarType.error => Icons.error,
    SnackBarType.warning => Icons.warning,
    SnackBarType.info => Icons.info,
  };

  final backgroundColor = switch (type) {
    SnackBarType.success => Palette.green,
    SnackBarType.error => Colors.red,
    SnackBarType.warning => Colors.orange,
    SnackBarType.info => Colors.blue,
  };

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      dismissDirection: DismissDirection.horizontal,
      elevation: 4,
    ),
  );
}
