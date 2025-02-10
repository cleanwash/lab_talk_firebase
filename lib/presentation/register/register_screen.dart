import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab_talk_firebase/core/components/app_bar_custom.dart';
import 'package:lab_talk_firebase/core/components/elevated_button_custom.dart';
import 'package:lab_talk_firebase/core/components/snackbar_custom.dart';
import 'package:lab_talk_firebase/core/components/text_form_field_custom.dart';
import 'package:lab_talk_firebase/core/theme/palette.dart';
import 'package:lab_talk_firebase/core/theme/typography.dart';
import 'package:lab_talk_firebase/core/util/routing/router_path.dart';
import 'package:lab_talk_firebase/presentation/register/register_view_model.dart';

import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordReController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordReController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RegisterViewModel>();
    return Scaffold(
      appBar: AppBarCustom(
        leadingIcon: IconButton(
          onPressed: () => context.go(RouterPath.login),
          icon: Icon(Icons.arrow_back),
        ),
        title: 'Lab Talk 회원가입 하기',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 16),
                TextFormFieldCustom(
                  sectionText: '이메일',
                  sectionTextColor: Palette.black,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                TextFormFieldCustom(
                  sectionText: '비밀번호',
                  sectionTextColor: Palette.black,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),
                TextFormFieldCustom(
                  sectionText: '비밀번호 재입력',
                  sectionTextColor: Palette.black,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  controller: _passwordReController,
                ),
                const SizedBox(height: 32),
                SizedBox(height: 45),
                ElevatedButtonCustom(
                  text: '가입하기',
                  style: titleMedium.copyWith(color: Palette.white),
                  backgroundColor: Palette.green,
                  onLoginClick: () {
                    if (_passwordController.text !=
                        _passwordReController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('비밀번호가 일치하지 않습니다.')),
                      );
                      return;
                    }
                    viewModel.signUp(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    showSnackBarCustom(context, '회원가입이 완료 되었습니다');
                    context.go(RouterPath.login);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
