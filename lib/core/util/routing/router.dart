import 'package:go_router/go_router.dart';
import 'package:lab_talk_firebase/core/util/routing/router_path.dart';
import 'package:lab_talk_firebase/data/data_source/splash_screen_items.dart';
import 'package:lab_talk_firebase/presentation/login/login_screen.dart';
import 'package:lab_talk_firebase/presentation/splash/splash_screen.dart';

final router = GoRouter(
  initialLocation: RouterPath.login,
  routes: [
    GoRoute(
      path: RouterPath.splash,
      builder: (context, state) => SplashScreen(
        splashScreenItems: SplashScreenItems(),
      ),
    ),
    GoRoute(
      path: RouterPath.login,
      builder: (context, state) => LoginScreen(),
    ),
  ],
);
