import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/user_profileVM/user_profile_vm.dart';
import 'package:stacked/stacked.dart';

class ClientProfile extends StatelessWidget {
  final Map userData;
  const ClientProfile({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UserProfileVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 0.02.sh,
                    left: 0.02.sw,
                    right: 0.02.sw,
                  ),
                  child: Column(
                    children: [
                      vModel.appbarService.customAppBar(
                        "Profile",
                        IconButton(
                          onPressed: () {
                            vModel.goBack();
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
                          child: SizedBox(
                            height: 140.h,
                            width: 140.w,
                            // color: AppColors.primaryColor,
                            child: Image.network(
                              userData['profilePhotoNetworkUrl'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      0.02.sh.verticalSpace,
                      Center(
                        child: Text(
                          userData['fname'] + " " + userData['lname'],
                          style: Style.medium20ptb,
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
