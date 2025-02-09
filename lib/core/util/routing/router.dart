import 'package:go_router/go_router.dart';
import 'package:lab_talk_firebase/core/presentation/navigation_screen.dart';
import 'package:lab_talk_firebase/core/util/routing/router_path.dart';
import 'package:lab_talk_firebase/data/data_source/email_auth.dart';
import 'package:lab_talk_firebase/data/data_source/google_auth.dart';
import 'package:lab_talk_firebase/data/data_source/kakao_auth.dart';
import 'package:lab_talk_firebase/data/data_source/splash_screen_items.dart';
import 'package:lab_talk_firebase/presentation/home/home_screen.dart';
import 'package:lab_talk_firebase/presentation/login/login_screen.dart';
import 'package:lab_talk_firebase/presentation/login/login_view_model.dart';
import 'package:lab_talk_firebase/presentation/notification/notification_screen.dart';
import 'package:lab_talk_firebase/presentation/register/register_screen.dart';
import 'package:lab_talk_firebase/presentation/register/register_view_model.dart';
import 'package:lab_talk_firebase/presentation/report/report_screen.dart';
import 'package:lab_talk_firebase/presentation/schedule/schedule_screen.dart';
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
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationScreen(
          body: navigationShell,
          currentPageIndex: navigationShell.currentIndex,
          onChangeIndex: (index) {
            navigationShell.goBranch(index,
                initialLocation: index == navigationShell.currentIndex);
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouterPath.home,
              builder: (context, state) => HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouterPath.schedule,
              builder: (context, state) => ScheduleScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouterPath.report,
              builder: (context, state) => ReportScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouterPath.notification,
              builder: (context, state) => NotificationScreen(),
            ),
          ],
        ),
      ],
    )
  ],
);
