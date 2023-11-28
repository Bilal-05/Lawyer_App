import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/clientVM/for_appointment_vm.dart';
import 'package:stacked/stacked.dart';

class ForAppointmentView extends StatelessWidget {
  const ForAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ForAppointmentVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(
                top: 0.075.sh,
                left: 0.05.sw,
                right: 0.05.sw,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Appointment',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Provide us your appointment details.',
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
                              vModel.practiceController,
                              'Practice Area',
                              (value) {
                                if (value == null) {
                                  return 'Please enter your practice area';
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
                              vModel.hourlyController,
                              'How much do you charge hourly?',
                              (value) {
                                if (value == null) {
                                  return 'Please enter your hourly rate';
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
                              vModel.locationController,
                              'Where is your office situated?',
                              (value) {
                                if (value == null) {
                                  return 'Please enter your office address';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                    child: vModel.dropDown(),
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
                        // vModel.navigateToTiming();
                        vModel.navigateToExperience();
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