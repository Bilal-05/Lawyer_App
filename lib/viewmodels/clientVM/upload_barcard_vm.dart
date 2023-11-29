// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'dart:io';

// import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/image_helper_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BarCardVM extends BaseViewModel {
  // List<String> frontSide = [];
  // List<String> backSide = [];
  // final navigationService = locator<NavigationService>();
  // final UserService userService = locator<UserService>();

  // bool mounted = true;

  // bool? firstLogin;

  // void onPressedfirst() async {
  //   List<String> pictureFront;
  //   try {
  //     pictureFront = await CunningDocumentScanner.getPictures(true) ?? [];
  //     if (!mounted) return;

  //     frontSide = pictureFront;
  //     notifyListeners();
  //     rebuildUi();
  //   } catch (exception) {
  //     // Handle exception here
  //   }
  // }

  // void onPressedback() async {
  //   List<String> pictureBack;
  //   try {
  //     pictureBack = await CunningDocumentScanner.getPictures(true) ?? [];
  //     if (!mounted) return;

  //     backSide = pictureBack;
  //     notifyListeners();
  //     rebuildUi();
  //   } catch (exception) {
  //     // Handle exception here
  //   }
  // }

  // removePicture(picture, List<String> picturess) {
  //   picturess.remove(picture);
  //   notifyListeners();
  //   rebuildUi();
  // }

  // var b3style = ElevatedButton.styleFrom(
  //   backgroundColor: AppColors.primaryColor,
  //   fixedSize: const Size(360, 60),
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(10),
  //   ),
  // );

  // setBool() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('firstLogin', false);
  //   firstLogin = prefs.getBool('firstLogin');
  //   notifyListeners();
  //   log(firstLogin.toString());
  // }

  // addFront() {
  //   // log(frontSide[0]);
  //   userService.barCardFrontUrl = frontSide[0].toString();
  //   notifyListeners();
  // }

  // addBack() {
  //   // log(backSide[0]);
  //   userService.barCardBackUrl = backSide[0].toString();
  //   notifyListeners();
  // }

  // navigateToBarCardBack() {
  //   addFront();
  //   navigationService.navigateToBarBackView();
  // }

  // navigateToMainMenu() {
  //   setBool();
  //   addBack();
  //   navigationService.navigateToMainMenuView();
  // }
  File? barFront;
  File? barBack;

  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  final imagePicker = locator<ImageHelperService>();

  final storageRef = FirebaseStorage.instance.ref();
  final snackbarService = locator<SnackbarService>();

  bool? firstLogin;
  bool? onBoardComplete;

  void onPressedBarFront() async {
    final XFile? file = await imagePicker.pickImage();
    if (file != null) {
      final croppedFile = await imagePicker.crop(
        file: file,
        cropStyle: CropStyle.rectangle,
      );
      if (croppedFile != null) {
        barFront = File(croppedFile.path);
        notifyListeners();
      }
    }
  }

  void onPressedBarBack() async {
    final XFile? file = await imagePicker.pickImage();
    if (file != null) {
      final croppedFile = await imagePicker.crop(
        file: file,
        cropStyle: CropStyle.rectangle,
      );
      if (croppedFile != null) {
        barBack = File(croppedFile.path);
        notifyListeners();
      }
    }
  }

  saveBarFrontImage() async {
    UploadTask uploadTask = storageRef
        .child(
            'images/barFront/${FirebaseAuth.instance.currentUser!.uid}_bar_front.jpeg')
        .putFile(barFront!, SettableMetadata(contentType: 'image/jpeg'));
    log('Done');
    notifyListeners();
  }

  saveBarBackImage() async {
    UploadTask uploadTask = storageRef
        .child(
            'images/barBack/${FirebaseAuth.instance.currentUser!.uid}_bar_back.jpeg')
        .putFile(barBack!, SettableMetadata(contentType: 'image/jpeg'));
    log('Done');
    notifyListeners();
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
    firstLogin = false;
    notifyListeners();
  }

  addFront() {
    userService.barCardFrontUrl =
        'images/barFront/${FirebaseAuth.instance.currentUser!.uid}_bar_front.jpeg';
    notifyListeners();

    log(userService.cnicFrontUrl!);
  }

  addBack() {
    userService.barCardBackUrl =
        'images/barBack/${FirebaseAuth.instance.currentUser!.uid}_bar_back.jpeg';
    notifyListeners();
    log(userService.cincBackUrl!);
  }

  navigateToBarBack() async {
    addFront();
    snackbarService.showSnackbar(
        message: 'Wait for a while',
        duration: const Duration(seconds: 2),
        title: 'Hold');
    await Future.delayed(const Duration(seconds: 2));
    saveBarFrontImage();
    snackbarService.showSnackbar(
        message: 'Front side of Bar License uploaded successfully',
        duration: const Duration(seconds: 2),
        title: 'Success');
    await Future.delayed(const Duration(seconds: 2));
    navigationService.replaceWithBarBackView();
    // navigationService.replaceWithUploadBarBackView();
  }

  navigateToMenuMain() async {
    addBack();
    snackbarService.showSnackbar(
        message: 'Wait for a while',
        duration: const Duration(seconds: 2),
        title: 'Hold');
    await Future.delayed(const Duration(seconds: 2));
    await setBool();
    await userService.addLawyer(firstLogin!);
    await saveBarBackImage();
    snackbarService.showSnackbar(
        message: 'Back side of Bar License uploaded successfully',
        duration: const Duration(seconds: 2),
        title: 'Success');
    await Future.delayed(const Duration(seconds: 2));

    navigationService.replaceWithMainMenuView();
  }
}
