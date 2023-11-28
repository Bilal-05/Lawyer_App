import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/lawyerVM/cnic_vm.dart';
import 'package:stacked/stacked.dart';

class CnicView extends StatelessWidget {
  const CnicView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => CnicVM(),
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
                children: [
                  Text(
                    'Enter Cnic',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Provide us your CNIC details.',
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
                              vModel.nameController,
                              'Full name',
                              (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                          20.verticalSpace,
                          Container(
                            child: vModel.textFieldService.customTextFormField(
                              TextInputType.number,
                              null,
                              vModel.cnicController,
                              '4XXXX-XXXXXXX-X',
                              (value) {
                                bool isCnic =
                                    RegExp('^[0-9]{5}-[0-9]{7}-[0-9]\$')
                                        .hasMatch(value!);
                                if (value.isEmpty || !isCnic) {
                                  return 'Enter CNIC in 4XXXX-XXXXXXX-X format';
                                }
                                return null;
                              },
                            ),
                          ),
                          20.verticalSpace,
                          // Container(
                          //   child:
                          //       vModel.textFieldService.customTextFormField(
                          //     TextInputType.visiblePassword,
                          //     null,
                          //     vModel.dobController,
                          //     'Date of birth',
                          //     (value) {
                          //       bool isDate = RegExp(
                          //               r'(([012][0-9])|(3[01]))\/([0]{0,1}[1-9]|1[012])\/\d{4} ([01][0-9]|[2][0-3]):([01345][0-9])')
                          //           .hasMatch(value!);
                          //       if (value.isEmpty || !isDate) {
                          //         return 'Please enter date';
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          // ),
                          // 20.verticalSpace,
                          // Container(
                          //   child:
                          //       vModel.textFieldService.customTextFormField(
                          //     TextInputType.datetime,
                          //     null,
                          //     vModel.doiController,
                          //     'Date of issue',
                          //     (value) {
                          //       bool isDate = RegExp(
                          //               r'(([012][0-9])|(3[01]))\/([0]{0,1}[1-9]|1[012])\/\d{4} ([01][0-9]|[2][0-3]):([01345][0-9])')
                          //           .hasMatch(value!);
                          //       if (value.isEmpty || !isDate) {
                          //         return 'Please enter date';
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          // ),
                          // 20.verticalSpace,
                          // Container(
                          //   child:
                          //       vModel.textFieldService.customTextFormField(
                          //     TextInputType.datetime,
                          //     null,
                          //     vModel.doeController,
                          //     'Date of expiry',
                          //     (value) {
                          //       bool isDate = RegExp(
                          //               r'(([012][0-9])|(3[01]))\/([0]{0,1}[1-9]|1[012])\/\d{4} ([01][0-9]|[2][0-3]):([01345][0-9])')
                          //           .hasMatch(value!);
                          //       if (value.isEmpty || !isDate) {
                          //         return 'Please enter date';
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          // ),
                          // vModel.dateTextField(
                          //   vModel.dobController,
                          //   context,
                          //   'Date of birth',
                          //   (value) {
                          //     if (value!.isEmpty) {
                          //       return 'Please enter date';
                          //     } else if (value == vModel.doiController.text) {
                          //       return 'Date of birth and date of issue cannot be same';
                          //     } else if (value == vModel.doeController.text) {
                          //       return 'Date of birth and date of expiry cannot be same';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // 20.verticalSpace,
                          // vModel.dateTextField(
                          //   vModel.doiController,
                          //   context,
                          //   'Date of issue',
                          //   (value) {
                          //     if (value!.isEmpty) {
                          //       return 'Please enter date';
                          //     } else if (value == vModel.dobController.text) {
                          //       return 'Date of issue and date of birth cannot be same';
                          //     } else if (value == vModel.doeController.text) {
                          //       return 'Date of issue and date of expiry cannot be same';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // 20.verticalSpace,
                          // vModel.dateTextField(
                          //   vModel.doeController,
                          //   context,
                          //   'Date of expiry',
                          //   (value) {
                          //     if (value!.isEmpty) {
                          //       return 'Please enter date';
                          //     } else if (value == vModel.dobController.text) {
                          //       return 'Date of expiry and date of birth cannot be same';
                          //     } else if (value == vModel.doiController.text) {
                          //       return 'Date of expiry and date of issue cannot be same';
                          //     }
                          //     return null;
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 0.03.sh),
                    child: ElevatedButton(
                      style: vModel.b3style,
                      onPressed: () {
                        vModel.navigateToScanView();
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
