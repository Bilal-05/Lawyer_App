// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartVM extends BaseViewModel {
  String personLaptop = 'assets/images/welcomeImage.png';
  final navigationService = locator<NavigationService>();

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(160, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  var b2style = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    fixedSize: const Size(160, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    side: BorderSide(color: AppColors.primaryColor, width: 1),
  );

  navigateToLogin() {
    navigationService.navigateToLoginView();
  }

  navigateToRegister() {
    navigationService.navigateToRegisterView();
  }
}
