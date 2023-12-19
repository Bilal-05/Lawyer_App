import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/clientVM/forclient_vm.dart';
import 'package:lawyer_app/widgets/customTextField.dart';
import 'package:stacked/stacked.dart';

class ClientView extends StatelessWidget {
  const ClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ClientVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 0.075.sh,
                    left: 0.05.sw,
                    right: 0.05.sw,
                  ),
                  child: Center(
                    child: SizedBox(
                      // height: 0.9.sh,
                      width: 1.sw,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
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
                                      backgroundImage:
                                          vModel.profileImage != null
                                              ? FileImage(vModel.profileImage!)
                                              : null,
                                      child: vModel.profileImage == null
                                          ? Text(
                                              'Set Profile Image',
                                              style:
                                                  Style.regular14ptb.copyWith(
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
                                            controller:
                                                vModel.fullnameController,
                                            hintText: 'Full name',
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter your full name';
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
                                            controller:
                                                vModel.designationController,
                                            hintText: 'Designation',
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter your designation';
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
                                            controller: vModel.bioController,
                                            hintText: 'Bio',
                                            validator: (value) {
                                              if (value!.isEmpty) {
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
                                // const Spacer(),
                              ],
                            ),
                          ),
                          20.verticalSpace,
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
