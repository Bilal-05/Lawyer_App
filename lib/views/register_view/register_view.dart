// ignore_for_file: valid_regexps

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/registerVM/register_vm.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => RegisterVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: InkWell(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    right: 0.05.sw,
                    left: 0.05.sw,
                    top: 0.075.sh,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: Text(
                            'Create Account',
                            style: Style.bol30ptb,
                          ),
                        ),
                        0.01.sh.verticalSpace,
                        Center(
                          child: SizedBox(
                            width: 350,
                            child: Text(
                              'Unlock your way to LegalEase by creating Account.',
                              style: Style.medium14ptb,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        0.06.sh.verticalSpace,
                        Center(
                          child: SizedBox(
                            child: Form(
                              key: vModel.formKey,
                              child: Column(
                                children: [
                                  Container(
                                    child: vModel.texttFieldService
                                        .customTextFormField(
                                      TextInputType.emailAddress,
                                      null,
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
                                  20.verticalSpace,
                                  Container(
                                    child: vModel.texttFieldService
                                        .customTextFormField(
                                      TextInputType.visiblePassword,
                                      null,
                                      vModel.passController,
                                      'Password',
                                      (value) {
                                        bool validPass = RegExp(
                                                "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@\$!%*#?&])[A-Za-z\\d@\$!%*#?&]{8,}\$")
                                            .hasMatch(value!);
                                        if (value.isEmpty || !validPass) {
                                          return 'Minimum eight characters and must be unique.';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    child: vModel.texttFieldService
                                        .customTextFormField(
                                      TextInputType.text,
                                      null,
                                      vModel.passConfirmController,
                                      'Confirm Password',
                                      (value) {
                                        if (value !=
                                            vModel.passController.text) {
                                          return 'Password does\'nt match.';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(
                        //     vertical: 0.02.sh,
                        //   ),
                        //   child: InkWell(
                        //     onTap: () {},
                        //     child: Text(
                        //       'Forgot your password?',
                        //       style: Style.semiBold16ptb,
                        //     ),
                        //   ),
                        // ),
                        // 20.verticalSpace,
                        0.03.sh.verticalSpace,
                        Center(
                          child: SizedBox(
                            child: ElevatedButton(
                              style: vModel.b1style,
                              onPressed: () {
                                vModel.register();
                              },
                              child: vModel.isBusy
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : Text(
                                      'Sign up',
                                      style: Style.semiBold20ptw,
                                    ),
                            ),
                          ),
                        ),
                        0.03.sh.verticalSpace,
                        Center(
                          child: SizedBox(
                            child: InkWell(
                              onTap: () {
                                vModel.navigateToLoginView();
                              },
                              child: Text(
                                'Already have an account',
                                style: Style.semiBold16ptb,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
