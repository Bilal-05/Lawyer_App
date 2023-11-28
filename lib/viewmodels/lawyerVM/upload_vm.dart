// import 'dart:developer';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked_services/stacked_services.dart';

// import 'dart:async';

class UploadCnicVM extends BaseViewModel {
  List<String> frontSide = [];
  List<String> backSide = [];
  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();

  bool mounted = true;

  bool? firstLogin;
  bool? onBoardComplete;

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
  }

  addFront() {
    // log(frontSide[0]);
    userService.cnicFrontUrl = frontSide[0].toString();
    notifyListeners();
  }

  addBack() {
    // log(backSide[0]);
    userService.cincBackUrl = backSide[0].toString();
    notifyListeners();
  }

  navigateToBack() async {
    addFront();
    navigationService.replaceWithUploadCnicBackView();
  }

  navigateToMenuMain() async {
    addBack();
    await setBool();
    await userService.addClient(firstLogin!);
    // userService.getClients();
    navigationService.replaceWithMainMenuView();
  }
}
