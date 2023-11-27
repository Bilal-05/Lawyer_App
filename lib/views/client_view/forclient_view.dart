import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/clientVM/forclient_vm.dart';
import 'package:stacked/stacked.dart';

class ClientView extends StatelessWidget {
  const ClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ClientVM(),
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
                  SizedBox(
                    child: Form(
                      key: vModel.formKey,
                      child: Column(
                        children: [
                          Container(
                            child: vModel.textFieldService.customTextFormField(
                              TextInputType.text,
                              null,
                              vModel.fullnameController,
                              'Full name',
                              (value) {
                                if (value == null) {
                                  return 'Please enter your full name';
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
                              vModel.designationController,
                              'Designation',
                              (value) {
                                if (value == null) {
                                  return 'Please enter your designation';
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
                              vModel.bioController,
                              'Bio',
                              (value) {
                                if (value == null) {
                                  return 'Write yourself a bio.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 20.verticalSpace,
                  const Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 0.03.sh),
                    child: ElevatedButton(
                      style: vModel.b1style,
                      onPressed: () {
                        // if (vModel.formKey.currentState!.validate()) {
                        //   // vModel.navigateToEducation();
                        // }
                        // print(vModel.fnameController.text);
                        // print(vModel.lnameController.text);
                        // print(vModel.phoneController.text);
                        vModel.navigateToEducation();
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
