// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/otpVM/otp_vm.dart';
import 'package:stacked/stacked.dart';

class OtpView extends StatelessWidget {
  final String email;
  const OtpView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => OtpVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              vModel.navigateToNewPassWord();
            },
            child: const Icon(Icons.arrow_forward),
          ),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: InkWell(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                      Text(
                        'OTP Verfication',
                        style: Style.bol30ptb,
                      ),
                      SizedBox(
                        width: 0.75.sw,
                        child: Text(
                          'Enter the code sent to email address.',
                          style: Style.medium14ptb,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      0.1.sh.verticalSpace,
                      SizedBox(
                        child: Text(
                          email,
                          style: Style.regular14ptb,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      0.03.sh.verticalSpace,
                      vModel.pin(
                        (s) {
                          if (s != "123456") {
                            vModel.controller.clear();
                            return "Invalid OTP";
                          }
                          return null;
                        },
                        (pin) => print(pin),
                      ),
                      0.02.sh.verticalSpace,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Didn\'t receive the code?',
                            style: Style.regular16ptb,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Resend Code',
                              style: Style.regular14ptb.copyWith(
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
