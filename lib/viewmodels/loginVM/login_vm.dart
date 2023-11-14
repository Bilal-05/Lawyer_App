import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/theme/colors.dart';
// import 'package:lawyer_app/theme/textstyle.dart';
// import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginVM extends BaseViewModel {
  bool obscureText = true;
  final navigationService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String google = 'assets/svg/google.svg';
  final texttFieldService = locator<TextFieldService>();

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  var b2style = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xffECECEC),
    fixedSize: const Size(300, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  navigateToForgotView() {
    navigationService.navigateToForgotView();
  }

  navigateToRegisterView() {
    navigationService.navigateToRegisterView();
  }

  navigateToBoardingView() {
    navigationService.navigateToOnBoardingView();
  }
}
