import 'package:go_router/go_router.dart';
import 'package:lab_talk_firebase/core/util/routing/router_path.dart';
import 'package:lab_talk_firebase/data/data_source/email_auth.dart';
import 'package:lab_talk_firebase/data/data_source/google_auth.dart';
import 'package:lab_talk_firebase/data/data_source/kakao_auth.dart';
import 'package:lab_talk_firebase/data/data_source/splash_screen_items.dart';
import 'package:lab_talk_firebase/presentation/login/login_screen.dart';
import 'package:lab_talk_firebase/presentation/login/login_view_model.dart';
import 'package:lab_talk_firebase/presentation/register/register_screen.dart';
import 'package:lab_talk_firebase/presentation/register/register_view_model.dart';
import 'package:lab_talk_firebase/presentation/splash/splash_screen.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: RouterPath.splash,
  routes: [
    GoRoute(
      path: RouterPath.splash,
      builder: (context, state) => SplashScreen(
        splashScreenItems: SplashScreenItems(),
      ),
    ),
    GoRoute(
      path: RouterPath.login,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => LoginViewModel(
          googleAuth: GoogleAuth(),
          kakaoAuth: KakaoAuth(),
          emailAuth: EmailAuth(),
        ),
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.register,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RegisterViewModel(
          emailAuth: EmailAuth(),
        ),
        child: RegisterScreen(),
      ),
    )
  ],
);
