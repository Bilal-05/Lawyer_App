import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/lawyerVM/forlawyer_vm.dart';
import 'package:lawyer_app/widgets/customTextField.dart';
import 'package:stacked/stacked.dart';

class LawyerView extends StatelessWidget {
  const LawyerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LawyerVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          // resizeToAvoidBottomInset: false,
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
                      Center(
                        child: InkWell(
                          onTap: () {
                            vModel.getProfileImage();
                          },
                          child: CircleAvatar(
                            radius: 100.r,
                            backgroundColor: AppColors.primaryColor,
                            backgroundImage: vModel.profileImage != null
                                ? FileImage(vModel.profileImage!)
                                : null,
                            child: vModel.profileImage == null
                                ? Text(
                                    'Set Profile Image',
                                    style: Style.regular14ptb.copyWith(
                                        // fontSize: 7.sp,
                                        color: Colors.white),
                                  )
                                : const Opacity(
                                    opacity: 0, child: Text('Hello')),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      SizedBox(
                        child: Form(
                          key: vModel.formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                child: CustomTextField(
                                  keyboardType: TextInputType.text,
                                  suffix: null,
                                  controller: vModel.fnameController,
                                  hintText: 'First name',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your first name';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              20.verticalSpace,
                              SizedBox(
                                child: CustomTextField(
                                  keyboardType: TextInputType.text,
                                  suffix: null,
                                  controller: vModel.lnameController,
                                  hintText: 'Last name',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter your Last name';
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
                      20.verticalSpace,
                      Container(
                        child: vModel.phoneNumberField(),
                      ),
                      20.verticalSpace,
                      // const Spacer(),
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
                          child: vModel.isBusy
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
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
