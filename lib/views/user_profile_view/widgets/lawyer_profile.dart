import 'package:flutter/material.dart';
import 'package:lawyer_app/viewmodels/user_profileVM/user_profile_vm.dart';
import 'package:stacked/stacked.dart';

class LawyerProfile extends StatelessWidget {
  final Map userData;
  const LawyerProfile({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UserProfileVM(),
      builder: (context, vModel, child) {
        return const Scaffold(
          body: Center(
            child: Text('Lawyer Profile'),
          ),
        );
      },
    );
  }
}
