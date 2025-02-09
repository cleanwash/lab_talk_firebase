import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab_talk_firebase/core/components/elevated_button_custom.dart';
import 'package:lab_talk_firebase/core/components/snackbar_custom.dart';
import 'package:lab_talk_firebase/core/components/text_form_field_custom.dart';
import 'package:lab_talk_firebase/core/theme/palette.dart';
import 'package:lab_talk_firebase/core/util/routing/router_path.dart';
import 'package:lab_talk_firebase/presentation/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();
    final state = viewModel.state;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 에러 메시지 표시
              if (state.error != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    state.error!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),

              // 이메일 입력
              TextFormFieldCustom(
                controller: _emailController,
                hintText: '이메일',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // 비밀번호 입력
              TextFormFieldCustom(
                controller: _passwordController,
                hintText: '비밀번호',
                isReadOnly: false,
              ),
              const SizedBox(height: 24),

              // 이메일 로그인 버튼
              ElevatedButtonCustom(
                text: '이메일로 로그인',
                backgroundColor: Palette.black,
                fontColor: Colors.white,
                onLoginClick: state.isLoading
                    ? () {}
                    : () async {
                        await viewModel.signInWithEmail(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        showSnackBarCustom(context, '로그인이 처리되었습니다');
                        context.go(RouterPath.home);
                      },
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('or'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 16),

              ElevatedButtonCustom(
                text: '카카오로 시작하기',
                backgroundColor: Palette.yellow,
                fontColor: Palette.black,
                imagePath: 'assets/images/sns-kakao.png',
                onLoginClick: state.isLoading
                    ? () {}
                    : () async {
                        await viewModel.signInWithKakao();
                      },
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              ElevatedButtonCustom(
                text: 'Google로 시작하기',
                backgroundColor: Palette.white,
                fontColor: Palette.black,
                imagePath: 'assets/images/sns-google.png',
                onLoginClick: state.isLoading
                    ? () {}
                    : () async {
                        await viewModel.signInWithGoogle();
                      },
                style: const TextStyle(fontSize: 16),
              ),

              if (state.isLoading)
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              const SizedBox(height: 16),

              ElevatedButtonCustom(
                text: '이메일로 가입하기',
                backgroundColor: Palette.green,
                fontColor: Colors.white,
                onLoginClick: () => context.go(RouterPath.register),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
