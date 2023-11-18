import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/lawyerVM/forlawyer_vm.dart';
import 'package:stacked/stacked.dart';

class LawyerView extends StatelessWidget {
  const LawyerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => LawyerVM(),
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
                    'Tell us about yourself',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Fill the form below to get started.',
                      style: Style.medium14ptb,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  0.03.sh.verticalSpace,
                  Container(
                    key: vModel.formKey,
                    child: Form(
                      child: Column(
                        children: [
                          Container(
                            child: vModel.textFieldService.customTextFormField(
                              TextInputType.text,
                              null,
                              vModel.fnameController,
                              'First name',
                              (value) {
                                if (value == null) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                            ),
                          ),
                          20.verticalSpace,
                          Container(
                            child: vModel.textFieldService.customTextFormField(
                              TextInputType.text,
                              null,
                              vModel.lnameController,
                              'Last name',
                              (value) {
                                if (value == null) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                            ),
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                    child: vModel.phoneNumberField(),
                  ),
                  20.verticalSpace,
                  const Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 0.03.sh),
                    child: ElevatedButton(
                      style: vModel.b1style,
                      onPressed: () {
                        // print(vModel.fnameController.text);
                        // print(vModel.lnameController.text);
                        // print(vModel.phoneController.text);
                        vModel.navigateToCnic();
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
        );
      },
    );
  }
}
