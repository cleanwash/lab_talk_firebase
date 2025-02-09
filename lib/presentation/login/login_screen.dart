import 'package:flutter/material.dart';
import 'package:lab_talk_firebase/core/components/app_bar_custom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarCustom());
  }
}
