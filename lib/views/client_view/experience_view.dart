import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/clientVM/experience_vm.dart';
import 'package:stacked/stacked.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ExperienceVM(),
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
                    'Experience',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Tell us about your experience.',
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
                              TextInputType.number,
                              null,
                              vModel.experienceController,
                              'Years of Experience.',
                              (value) {
                                if (value == null) {
                                  return 'Enter your no. of experience';
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
                              vModel.noOfCasesController,
                              'Number of Cases Handled.',
                              (value) {
                                if (value == null) {
                                  return 'Enter your no. of cases handled';
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
                              vModel.wonCasesController,
                              'Number of cases won.',
                              (value) {
                                if (value == null) {
                                  return 'Enter your no. of cases won';
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
                              vModel.ratingController,
                              'Rating',
                              (value) {
                                if (value == null) {
                                  return 'Tap the button below to rate yourself';
                                }
                                return null;
                              },
                            ),
                          ),
                          10.verticalSpace,
                          TextButton(
                            onPressed: () {
                              vModel.calculateRating();
                            },
                            child: Text(
                              'Rate yourself',
                              style: Style.regular16ptb,
                            ),
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
                        // vModel.navigateToAppointmentView();
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
