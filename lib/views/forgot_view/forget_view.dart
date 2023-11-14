import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/forgotVM/forget_vm.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class ForgotView extends StatelessWidget {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ForgotVM(),
      builder: (context, vModel, child) {
        return Scaffold(
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
                        'Forget Password',
                        style: Style.bol30ptb,
                      ),
                      Container(
                        width: 0.75.sw,
                        child: Text(
                          'Reset your password here.',
                          style: Style.medium14ptb,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      0.03.sh.verticalSpace,
                      Container(
                        width: 0.50.sw,
                        child: Lottie.asset(vModel.forgot),
                      ),
                      0.03.sh.verticalSpace,
                      SizedBox(
                        width: 0.65.sw,
                        child: Text(
                          'Receive an email to reset your password.',
                          style: Style.medium14ptb,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      0.03.sh.verticalSpace,
                      SizedBox(
                        child: Form(
                          key: vModel.formKey,
                          child: vModel.textFieldService.customTextFormField(
                            vModel.emailController,
                            'Email',
                            (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);

                              if (value.isEmpty || !emailValid) {
                                return 'Enter correct email';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: 0.03.sh),
                        child: ElevatedButton(
                          style: vModel.b1style,
                          onPressed: () {
                            // if (vModel.formKey.currentState!.validate()) {}
                            vModel.navigateToOtpView();
                          },
                          child: Text(
                            'Send Email',
                            style: Style.semiBold20ptw,
                          ),
                        ),
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
