import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab_talk_firebase/core/util/assets_path.dart';

class NavigationScreen extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;

  const NavigationScreen({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body,
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                );
              }
              return const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: 'Pretendard',
              );
            }),
          ),
          child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            indicatorColor: Colors.transparent,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            onDestinationSelected: onChangeIndex,
            selectedIndex: currentPageIndex,
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  AssetsPath.home,
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                label: 'home',
                selectedIcon: SvgPicture.asset(
                  AssetsPath.home,
                  colorFilter:
                      const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  AssetsPath.schedule,
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                label: 'schedule',
                selectedIcon: SvgPicture.asset(
                  AssetsPath.schedule,
                  colorFilter:
                      const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  AssetsPath.report,
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                label: 'report',
                selectedIcon: SvgPicture.asset(
                  AssetsPath.report,
                  colorFilter:
                      const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  AssetsPath.notification,
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                label: 'notification',
                selectedIcon: SvgPicture.asset(
                  AssetsPath.notification,
                  colorFilter:
                      const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
              ),
            ],
          ),
        ));
  }
}
