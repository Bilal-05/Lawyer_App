import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotSelectVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
  final userService = locator<UserService>();
  String forgot = 'assets/JSON/Sofa.json';

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  // navigateToOtpView() {
  //   userService.phoneNumber != null
  //       ? navigationService.navigateToOtpView()
  //       : snackBarService.showSnackbar(
  //           message: 'No number found',
  //           title: 'Error',
  //           duration: const Duration(seconds: 2),
  //         );
  // }

  navigateToForgotView() {
    navigationService.replaceWithForgotView();
  }
}
