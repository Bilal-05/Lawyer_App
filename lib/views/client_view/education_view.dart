import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/clientVM/education_vm.dart';
import 'package:stacked/stacked.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => EducationVM(),
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
                              vModel.institutionController,
                              'Institution name',
                              (value) {
                                if (value == null) {
                                  return 'Please enter institution name';
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
                              vModel.degreeController,
                              'Degree',
                              (value) {
                                if (value == null) {
                                  return 'What degree did you persue?.';
                                }
                                return null;
                              },
                            ),
                          ),
                          20.verticalSpace,
                          vModel.dateTextField(
                            vModel.doeController,
                            context,
                            'Year of enrollment',
                            (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your year of enrollment';
                              } else if (value == vModel.dogController.text) {
                                return 'Date of enrollment and date of graduation cannot be same';
                              }
                              return null;
                            },
                          ),
                          20.verticalSpace,
                          vModel.dateTextField(
                            vModel.doeController,
                            context,
                            'Year of graduation',
                            (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your year of graduation';
                              } else if (value == vModel.doeController.text) {
                                return 'Date of graduation and date of enrollment cannot be same';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 20.verticalSpace,
                  // Container(
                  //     // child: vModel.phoneNumberField(),
                  //     ),
                  // 20.verticalSpace,
                  const Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 0.03.sh),
                    child: ElevatedButton(
                      style: vModel.b1style,
                      onPressed: () {
                        // print(vModel.fnameController.text);
                        // print(vModel.lnameController.text);
                        // print(vModel.phoneController.text);
                        vModel.navigateToTiming();
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
