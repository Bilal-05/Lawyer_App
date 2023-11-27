import 'package:flutter/material.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/splashVM/splash_vm.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => SplashVM(),
      builder: (ctx, vModel, child) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Center(
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
          ),
        );
      },
    );
  }
}
