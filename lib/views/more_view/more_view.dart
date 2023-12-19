import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/moreVM/more_vm.dart';
import 'package:stacked/stacked.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => MoreVM(),
        builder: (context, vModel, child) {
          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 0.1.sh, left: 0.05.sw, right: 0.05.sw),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 75.r,
                            backgroundImage: NetworkImage(vModel.userService
                                .userData['profilePhotoNetworkUrl']),
                          ),
                          5.verticalSpace,
                          SizedBox(
                            child: Text(
                              vModel.userService.userData['fullName'] ??
                                  '${vModel.userService.userData['fname']} ${vModel.userService.userData['lname']}',
                              style: Style.bol30ptb.copyWith(fontSize: 20.sp),
                            ),
                          ),

                          // 2.verticalSpace,
                          if (vModel.userService.userData['userType'] ==
                              'lawyer')
                            SizedBox(
                              child: Text(
                                vModel.userService.userData['designation'],
                                style: Style.semiBold16ptb,
                              ),
                            ),

                          0.03.sh.verticalSpace,
                          // InkWell(
                          //   onTap: () {
                          //     vModel.goToProfile();
                          //   },
                          //   child: Text(
                          //     'Profile',
                          //     style: Style.medium20ptb,
                          //   ),
                          // ),

                          // Divider(
                          //   color: AppColors.primaryColor,
                          //   thickness: 3,
                          //   height: 0.02.sh,
                          //   indent: 100.0,
                          //   endIndent: 100.0,
                          // ),

                          if (vModel.userService.userData['userType'] ==
                              'lawyer')
                            20.verticalSpace,
                          if (vModel.userService.userData['userType'] ==
                              'lawyer')
                            InkWell(
                              onTap: () {
                                vModel.goToRequest();
                              },
                              child: Text(
                                'Appointment Request',
                                style: Style.medium20ptb,
                              ),
                            ),
                          if (vModel.userService.userData['userType'] ==
                              'lawyer')
                            Divider(
                              color: AppColors.primaryColor,
                              thickness: 3,
                              height: 0.02.sh,
                              indent: 100.0,
                              endIndent: 100.0,
                            ),

                          // if (vModel.userService.userData['userType'] ==
                          //     'lawyer')
                          // 20.verticalSpace,
                          // if (vModel.userService.userData['userType'] ==
                          //     'client')
                          20.verticalSpace,
                          InkWell(
                            onTap: () {
                              vModel.goToRespone();
                            },
                            child: Text(
                              'Appointment Response',
                              style: Style.medium20ptb,
                            ),
                          ),

                          Divider(
                            color: AppColors.primaryColor,
                            thickness: 3,
                            height: 0.02.sh,
                            indent: 100.0,
                            endIndent: 100.0,
                          ),
                          20.verticalSpace,
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Calender',
                              style: Style.medium20ptb,
                            ),
                          ),
                          Divider(
                            color: AppColors.primaryColor,
                            thickness: 3,
                            height: 0.02.sh,
                            indent: 100.0,
                            endIndent: 100.0,
                          ),
                          20.verticalSpace,
                          InkWell(
                            onTap: () {
                              vModel.signOut();
                            },
                            child: Text(
                              'Sign Out',
                              style: Style.medium20ptb,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
