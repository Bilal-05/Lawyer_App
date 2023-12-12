// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/image_helper_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked_services/stacked_services.dart';

class UploadCnicVM extends BaseViewModel {
  File? scannnedFront;
  File? scannnedBack;

  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  final imagePicker = locator<ImageHelperService>();

  final storageRef = FirebaseStorage.instance.ref();
  final snackbarService = locator<SnackbarService>();

  bool? firstLogin;
  bool? onBoardComplete;

  void onPressedfirst() async {
    log('pressed');
    final XFile? file = await imagePicker.pickImage();
    if (file != null) {
      final croppedFile = await imagePicker.crop(
        file: file,
        cropStyle: CropStyle.rectangle,
      );
      if (croppedFile != null) {
        scannnedFront = File(croppedFile.path);
        notifyListeners();
      }
    }
    log('out');
  }

  void onPressedback() async {
    final XFile? file = await imagePicker.pickImage();
    if (file != null) {
      final croppedFile = await imagePicker.crop(
        file: file,
        cropStyle: CropStyle.rectangle,
      );
      if (croppedFile != null) {
        scannnedBack = File(croppedFile.path);
        notifyListeners();
      }
    }
  }

  saveFrontImage() async {
    UploadTask uploadTask = storageRef
        .child('images/cnicFront/${userService.cnicNumber}_cnic_front.jpeg')
        .putFile(scannnedFront!, SettableMetadata(contentType: 'image/jpeg'));
    log('Done');
    notifyListeners();
  }

  saveBackImage() async {
    UploadTask uploadTask = storageRef
        .child('images/cnicBack/${userService.cnicNumber}_cnic_back.jpeg')
        .putFile(scannnedBack!, SettableMetadata(contentType: 'image/jpeg'));
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
    firstLogin = prefs.getBool('firstLogin');
    notifyListeners();
  }

  addFront() {
    userService.cnicFrontUrl =
        'images/cnicFront/${userService.cnicNumber}_cnic_front.jpeg';
    notifyListeners();

    log(userService.cnicFrontUrl!);
  }

  addBack() {
    userService.cincBackUrl =
        'images/cnicBack/${userService.cnicNumber}_cnic_back.jpeg';
    notifyListeners();
    log(userService.cincBackUrl!);
  }

  navigateToBack() async {
    addFront();
    snackbarService.showSnackbar(
        message: 'Wait for a while',
        duration: const Duration(seconds: 2),
        title: 'Hold');
    await Future.delayed(const Duration(seconds: 2));
    await saveFrontImage();
    snackbarService.showSnackbar(
        message: 'Front side of CNIC uploaded successfully',
        duration: const Duration(seconds: 2),
        title: 'Success');
    await Future.delayed(const Duration(seconds: 2));

    navigationService.replaceWithUploadCnicBackView();
  }

  navigateToMenuMain() async {
    addBack();
    snackbarService.showSnackbar(
        message: 'Wait for a while',
        duration: const Duration(seconds: 2),
        title: 'Hold');
    await Future.delayed(const Duration(seconds: 2));
    await setBool();
    await userService.addClientinClient(false);
    await userService.addClientinUser(false);
    await saveBackImage();
    snackbarService.showSnackbar(
        message: 'Back side of CNIC uploaded successfully',
        duration: const Duration(seconds: 2),
        title: 'Success');
    await Future.delayed(const Duration(seconds: 2));

    navigationService.replaceWithMainMenuView();
  }
}
