import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/appointmentVM/appointment_vm.dart';
import 'package:lawyer_app/views/appointment_view/widgets/date_picker.dart';
import 'package:lawyer_app/views/appointment_view/widgets/direct_selector.dart';
import 'package:lawyer_app/widgets/customtextfield.dart';
import 'package:stacked/stacked.dart';

class AppointmentView extends StatelessWidget {
  final Map data;
  final List timing;
  const AppointmentView({super.key, required this.data, required this.timing});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => AppointmentVM(),
      onViewModelReady: (viewModel) =>
          viewModel.initialize(timing), //, context),
      builder: (context, vModel, child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 0.02.sh, left: 0.02.sw, right: 0.02.sw),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vModel.appBarService.customAppBar(
                        'Appointment',
                        IconButton(
                          onPressed: () {
                            vModel.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Container(),
                      ),
                      0.02.sh.verticalSpace,
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          // clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: SizedBox(
                            height: 140.h,
                            width: 140.w,
                            // color: AppColors.primaryColor,
                            child: Image.network(
                              data['profilePhotoNetworkUrl'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      Center(
                        child: SizedBox(
                          width: 0.8.sw,
                          child: Text(
                            data['fullName'],
                            style: Style.medium20ptb,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      5.verticalSpace,
                      Center(
                        child: Text(
                          data['designation'],
                          style: Style.regular14ptb,
                        ),
                      ),
                      20.verticalSpace,
                      Container(
                        margin: EdgeInsets.only(
                          left: 0.02.sw,
                          // right: 0.01.sw,
                        ),
                        child: const DateSelector(),
                      ),
                      20.verticalSpace,
                      Container(
                        margin: EdgeInsets.only(
                          left: 0.02.sw,
                          // right: 0.01.sw,
                        ),
                        child: Text(
                          'Visit Hours:',
                          style: Style.medium20ptb,
                        ),
                      ),
                      5.verticalSpace,
                      if (vModel.hour.isNotEmpty) Direct(timing: timing),
                      20.verticalSpace,
                      Container(
                        margin: EdgeInsets.only(
                          left: 0.02.sw,
                        ),
                        child: Text('Issue Facing:', style: Style.medium20ptb),
                      ),
                      5.verticalSpace,
                      Container(
                        margin: EdgeInsets.only(
                          left: 0.02.sw,
                          // right: 0.01.sw,
                        ),
                        child: Form(
                          key: vModel.formKey,
                          child: CustomTextField(
                            controller: vModel.descriptionController,
                            hintText: 'Describe your problem',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your problem';
                              } else if (value.length > 100) {
                                return 'Problem must be 100 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 0.03.sh),
                          child: ElevatedButton(
                            style: vModel.b1style,
                            onPressed: () async {
                              final user = FirebaseAuth.instance.currentUser;
                              if (data['uid'] != user!.uid) {
                                if (vModel.formKey.currentState!.validate() ||
                                    vModel.hour.isNotEmpty ||
                                    vModel.selectedDate != null ||
                                    vModel.descriptionController.text != '') {
                                  await vModel.sendRequestTo(data['uid'],
                                      vModel.userService.userData, data);
                                }
                              } else {
                                vModel.snackbarService.showSnackbar(
                                  title: 'Error',
                                  message:
                                      'You cannot send request to yourself',
                                  duration: const Duration(seconds: 1),
                                );
                              }
                            },
                            child: Text(
                              'Send Request',
                              style: Style.semiBold20ptw,
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
        );
      },
    );
  }
}
