import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/forgotVM/forgot_select_vm.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class ForgotSelectView extends StatelessWidget {
  const ForgotSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ForgotSelectVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              width: 1.sw,
              height: 1.sh,
              margin: EdgeInsets.only(
                top: 0.075.sh,
                left: 0.05.sw,
                right: 0.05.sw,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Select Option',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Select the option to reset your password.',
                      style: Style.medium14ptb,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  0.1.sh.verticalSpace,
                  SizedBox(
                    width: 0.50.sw,
                    child: Lottie.asset(vModel.forgot),
                  ),
                  const Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 0.03.sh),
                    child: ElevatedButton(
                      style: vModel.b1style,
                      onPressed: () {
                        vModel.navigateToForgotView();
                      },
                      child: Text(
                        'via Email',
                        style: Style.semiBold20ptw,
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 0.03.sh),
                  //   child: ElevatedButton(
                  //     style: vModel.b1style,
                  //     onPressed: () {
                  //       vModel.navigateToOtpView();
                  //     },
                  //     child: Text(
                  //       'via PhoneNumber',
                  //       style: Style.semiBold20ptw,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
