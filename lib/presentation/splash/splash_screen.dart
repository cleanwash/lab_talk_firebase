import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lab_talk_firebase/core/theme/palette.dart';
import 'package:lab_talk_firebase/data/data_source/splash_screen_items.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenItems splashScreenItems;

  const SplashScreen({
    super.key,
    required this.splashScreenItems,
  });

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);
    if (!context.mounted) return;
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: IntroductionScreen(
        pages: splashScreenItems.items
            .map((item) => PageViewModel(
                  title: item.title,
                  body: item.description,
                  image: SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  decoration: PageDecoration(
                    imageFlex: 2,
                    titleTextStyle:
                        TextStyle(color: Palette.black, fontSize: 24),
                    bodyTextStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Palette.black,
                    ),
                    bodyAlignment: Alignment.center,
                    titlePadding: EdgeInsets.zero,
                    bodyPadding: EdgeInsets.only(top: 20.0),
                  ),
                ))
            .toList(),
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Text("Next"),
        done: const Text("Done"),
        onSkip: () => _completeOnboarding(context),
        onDone: () => _completeOnboarding(context),
      ),
    );
  }
}
