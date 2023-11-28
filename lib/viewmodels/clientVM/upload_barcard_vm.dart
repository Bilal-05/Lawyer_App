import 'dart:developer';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BarCardVM extends BaseViewModel {
  List<String> frontSide = [];
  List<String> backSide = [];
  final navigationService = locator<NavigationService>();
  final UserService userService = locator<UserService>();

  bool mounted = true;

  bool? firstLogin;

  void onPressedfirst() async {
    List<String> pictureFront;
    try {
      pictureFront = await CunningDocumentScanner.getPictures(true) ?? [];
      if (!mounted) return;

      frontSide = pictureFront;
      notifyListeners();
      rebuildUi();
    } catch (exception) {
      // Handle exception here
    }
  }

  void onPressedback() async {
    List<String> pictureBack;
    try {
      pictureBack = await CunningDocumentScanner.getPictures(true) ?? [];
      if (!mounted) return;

      backSide = pictureBack;
      notifyListeners();
      rebuildUi();
    } catch (exception) {
      // Handle exception here
    }
  }

  removePicture(picture, List<String> picturess) {
    picturess.remove(picture);
    notifyListeners();
    rebuildUi();
  }

  var b3style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  setBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstLogin', false);
    firstLogin = prefs.getBool('firstLogin');
    notifyListeners();
    log(firstLogin.toString());
  }

  addFront() {
    // log(frontSide[0]);
    userService.barCardFrontUrl = frontSide[0].toString();
    notifyListeners();
  }

  addBack() {
    // log(backSide[0]);
    userService.barCardBackUrl = backSide[0].toString();
    notifyListeners();
  }

  navigateToBarCardBack() {
    addFront();
    navigationService.navigateToBarBackView();
  }

  navigateToMainMenu() {
    setBool();
    addBack();
    navigationService.navigateToMainMenuView();
  }
}
