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
                    Text(
                      'Forget Password',
                      style: Style.bol30ptb,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 0.010.sh,
                      ),
                      width: 250.w,
                      child: Text(
                        'Reset your password here.',
                        style: Style.medium16ptb,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.04.sh),
                      width: 300.w,
                      child: Lottie.asset(vModel.forgot),
                    ),
                    25.verticalSpace,
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        'Receive an email to reset your password.',
                        style: Style.medium16ptb,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    25.verticalSpace,
                    SizedBox(
                      child: Form(
                        key: vModel.formKey,
                        child: vModel.textFieldService.customTextFormField(
                          vModel.emailController,
                          'Email',
                          (value) {
                            bool emailValid =
                                RegExp(r'[\w-\.]+@(\w-])+\.)+[\w-]{2-4}')
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
                    25.verticalSpace,
                    ElevatedButton(
                      style: vModel.b1style,
                      onPressed: () {},
                      child: Text(
                        'Send Email',
                        style: Style.semiBold20ptw,
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
