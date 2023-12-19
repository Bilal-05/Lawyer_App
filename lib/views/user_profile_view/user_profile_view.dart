import 'package:flutter/material.dart';
import 'package:lawyer_app/viewmodels/user_profileVM/user_profile_vm.dart';
import 'package:lawyer_app/views/user_profile_view/widgets/client_profile.dart';
import 'package:lawyer_app/views/user_profile_view/widgets/lawyer_profile.dart';
import 'package:stacked/stacked.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => UserProfileVM(),
      builder: (context, vModel, child) {
        if (vModel.userService.userData['userType'] == 'client') {
          return ClientProfile(userData: vModel.userService.userData);
        } else {
          return LawyerProfile(userData: vModel.userService.userData);
        }
      },
    );
  }
}
