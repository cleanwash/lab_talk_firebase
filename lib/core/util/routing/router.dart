import 'package:go_router/go_router.dart';
import 'package:lab_talk_firebase/core/util/routing/router_path.dart';
import 'package:lab_talk_firebase/data/data_source/splash_screen_items.dart';
import 'package:lab_talk_firebase/presentation/splash/splash_screen.dart';

final router = GoRouter(
  initialLocation: RouterPath.splash,
  routes: [
    GoRoute(
      path: RouterPath.splash,
      builder: (context, state) => SplashScreen(
        splashScreenItems: SplashScreenItems(),
      ),
    ),
  ],
);
