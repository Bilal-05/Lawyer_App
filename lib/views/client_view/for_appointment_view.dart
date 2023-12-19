import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/clientVM/for_appointment_vm.dart';
import 'package:lawyer_app/widgets/customTextField.dart';
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
            child: SizedBox(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 0.075.sh,
                    left: 0.05.sw,
                    right: 0.05.sw,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.end,
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
                      vModel.area(),
                      20.verticalSpace,
                      SizedBox(
                        child: Form(
                          key: vModel.formKey,
                          child: Column(
                            children: [
                              // SizedBox(
                              //   child: CustomTextField(
                              //     keyboardType: TextInputType.text,
                              //     suffix: null,
                              //     controller: vModel.practiceController,
                              //     hintText: 'Eg. Civil, Criminal, Family etc.',
                              //     validator: (value) {
                              //       if (value!.isEmpty) {
                              //         return 'Please enter your practice area';
                              //       } else if (value.contains('_') ||
                              //           value.contains('.') ||
                              //           value.contains(r'[0-9]')) {
                              //         return 'It should not contain special characters or numbers';
                              //       }
                              //       return null;
                              //     },
                              //   ),
                              // ),
                              20.verticalSpace,
                              SizedBox(
                                child: CustomTextField(
                                  keyboardType: TextInputType.text,
                                  suffix: null,
                                  controller: vModel.hourlyController,
                                  hintText: 'Fees in PKR',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your fees';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              20.verticalSpace,
                              SizedBox(
                                child: CustomTextField(
                                  keyboardType: TextInputType.text,
                                  suffix: null,
                                  controller: vModel.locationController,
                                  hintText: 'Where is your office situated?',
                                  validator: (value) {
                                    if (value!.isEmpty) {
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
                        child: vModel.dropDownConsultation(),
                      ),
                      // 0.22.sh.verticalSpace,
                      20.verticalSpace,
                      Container(
                        margin: EdgeInsets.only(bottom: 0.03.sh),
                        child: ElevatedButton(
                          style: vModel.b1style,
                          onPressed: () {
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
            ),
          ),
        );
      },
    );
  }
}
