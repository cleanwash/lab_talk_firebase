import 'package:flutter/material.dart';
import 'package:lab_talk_firebase/core/theme/palette.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class FloatingActionButtomCustom extends StatelessWidget {
  final List<String> texts;
  final List<Widget> icons;
  final Function(int) onPressed;
  final Color color;

  const FloatingActionButtomCustom({
    super.key,
    required this.texts,
    required this.icons,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      speedDialChildren: List.generate(
        texts.length,
        (index) => SpeedDialChild(
          child: icons[index],
          foregroundColor: Palette.white,
          backgroundColor: color,
          label: texts[index],
          onPressed: () => onPressed(index),
        ),
      ),
      closedForegroundColor: Colors.white,
      openForegroundColor: Colors.white,
      closedBackgroundColor: color,
      openBackgroundColor: color,
      child: Icon(Icons.add),
    );
  }
}
