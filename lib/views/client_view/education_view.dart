import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/clientVM/education_vm.dart';
import 'package:stacked/stacked.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
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
                    'Education',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Tell us about your education.',
                      style: Style.medium14ptb,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  0.03.sh.verticalSpace,
                  Container(
                    child: vModel.dropDownInstitute(),
                  ),
                  20.verticalSpace,
                  Container(
                    child: vModel.dropDownDegree(),
                  ),
                  20.verticalSpace,
                  SizedBox(
                    child: Form(
                      key: vModel.formKey,
                      child: Column(
                        children: [
                          vModel.dateTextField(
                            vModel.dogController,
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
                  // 20.verticalSpace,
                  Container(
                    margin: EdgeInsets.only(bottom: 0.03.sh),
                    child: ElevatedButton(
                      style: vModel.b1style,
                      onPressed: () {
                        // print(vModel.fnameController.text);
                        // print(vModel.lnameController.text);
                        // print(vModel.phoneController.text);
                        // vModel.navigateToAppointmentView();
                        vModel.navigateToAppointmentView();
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
