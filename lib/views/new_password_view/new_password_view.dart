import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/new_passwordVM/new_password_vm.dart';
import 'package:stacked/stacked.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => NewPasswordVM(),
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
              child: Column(
                children: [
                  Text(
                    'Update password',
                    style: Style.bol30ptb,
                  ),
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Update your password to continue.',
                      style: Style.medium14ptb,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  0.04.sh.verticalSpace,
                  SizedBox(
                    child: Form(
                      key: vModel.formKey,
                      child: Column(
                        children: [
                          Container(
                            child: vModel.textFieldService.customTextFormField(
                              vModel.newPassController,
                              'New password',
                              (value) {
                                bool validPass = RegExp(
                                        "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}\$")
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
                            child: vModel.textFieldService.customTextFormField(
                              vModel.confirmPassController,
                              'Confirm password',
                              (value) {
                                if (value != vModel.newPassController.text) {
                                  return 'Password doesn\'t match.';
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
                  const Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 0.03.sh),
                    child: ElevatedButton(
                      style: vModel.b1style,
                      onPressed: () {
                        if (vModel.formKey.currentState!.validate()) {}
                      },
                      child: Text(
                        'Update password',
                        style: Style.semiBold20ptw,
                      ),
                    ),
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
