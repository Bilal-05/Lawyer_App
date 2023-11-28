import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExperienceVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final textFieldService = locator<TextFieldService>();
  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();
  final snackbarService = locator<SnackbarService>();
  TextEditingController experienceController = TextEditingController();
  TextEditingController noOfCasesController = TextEditingController();
  TextEditingController wonCasesController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  calculateRating() {
    if (formKey.currentState!.validate()) {
      var wonCases = double.parse(wonCasesController.text);
      var noOfCases = double.parse(noOfCasesController.text);
      num rating = (wonCases / noOfCases) * 100;
      notifyListeners();
      double stars = 0;
      if (rating <= 50) {
        stars = 0;
      } else if (rating <= 60) {
        stars = 1;
        notifyListeners();
      } else if (rating <= 70) {
        stars = 2;
        notifyListeners();
      } else if (rating <= 80) {
        stars = 3;
        notifyListeners();
      } else if (rating <= 90) {
        stars = 4;
        notifyListeners();
      } else {
        stars = 5;
        notifyListeners();
      }

      ratingController.text = stars.toString();
    }
  }

  add() {
    userService.experience = experienceController.text;
    userService.noOfCases = noOfCasesController.text;
    userService.noOfWins = wonCasesController.text;
    userService.rating = ratingController.text;
    notifyListeners();
  }

  navigateToTiming() {
    if (formKey.currentState!.validate()) {
      add();
      navigationService.navigateToTimingView();
    } else {
      snackbarService.showSnackbar(
        message: 'Fill all fields',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
    }
  }
}
