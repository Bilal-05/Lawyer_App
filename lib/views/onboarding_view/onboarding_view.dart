import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:lawyer_app/theme/colors.dart';
// import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/onboardingVM/onboarding_vm.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OnBoardingVM(),
      builder: (ctx, vModel, child) {
        return Scaffold(
          // backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Container(
              width: 1.sw,
              height: 1.sh,
              margin: EdgeInsets.only(
                right: 0.05.sw,
                left: 0.05.sw,
                top: 0.075.sh,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 0.75.sw,
                      child: Text(
                        'What are  you looking for?',
                        textAlign: TextAlign.center,
                        style: Style.bol30ptb,
                      ),
                    ),
                    Container(child: Lottie.asset(vModel.looking)),
                    0.02.sh.verticalSpace,
                    Container(
                      child: vModel.dropDown(),
                    ),
                    const Spacer(),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 0.03.sh,
                      ),
                      child: ElevatedButton(
                        style: vModel.b1style,
                        onPressed: () {
                          vModel.navigateToOnBoardingView();
                        },
                        child: Text(
                          'Next',
                          style: Style.semiBold20ptw,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
