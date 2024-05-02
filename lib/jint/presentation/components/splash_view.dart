import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:jint/core/theme/themeData/themeDataDark.dart';
import 'package:jint/core/utils/App_String.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: context.styleHeader1,
                child: AnimatedTextKit(
                  totalRepeatCount: 99999,
                  animatedTexts: [
                    WavyAnimatedText(AppString.appName.toUpperCase()),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
