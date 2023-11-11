import 'package:flutter/material.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/splashVM/splash_vm.dart';
import 'package:lawyer_app/views/start_view/start_view.dart';
import 'package:stacked/stacked.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SplashVM(),
      builder: (ctx, vModel, child) {
        return FlutterSplashScreen.fadeIn(
          backgroundColor: AppColors.primaryColor,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    vModel.logo,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  'Legal Ease',
                  style: Style.semiBold35ptw,
                ),
              ],
            ),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: const StartView(),
          duration: const Duration(seconds: 3),
        );
      },
    );
  }
}
