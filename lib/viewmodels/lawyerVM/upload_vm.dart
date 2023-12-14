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

  openCamera() async {
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

  void onPressedback() async {
    await openCamera();
    await addBack();
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

  addFront() async {
    await saveFrontImage();
    userService.cnicFrontUrl =
        'images/cnicFront/${userService.cnicNumber}_cnic_front.jpeg';
    notifyListeners();

    log(userService.cnicFrontUrl!);
  }

  addBack() async {
    await saveBackImage();
    userService.cincBackUrl =
        'images/cnicBack/${userService.cnicNumber}_cnic_back.jpeg';
    notifyListeners();
    log(userService.cincBackUrl!);
  }

  navigateToBack() async {
    setBusy(true);
    addFront();
    snackbarService.showSnackbar(
        message: 'Wait for a while',
        duration: const Duration(seconds: 2),
        title: 'Hold');
    await Future.delayed(const Duration(seconds: 2));
    snackbarService.showSnackbar(
        message: 'Front side of CNIC uploaded successfully',
        duration: const Duration(seconds: 2),
        title: 'Success');
    await Future.delayed(const Duration(seconds: 2));
    setBusy(false);
    navigationService.replaceWithUploadCnicBackView();
  }

  final downloadRef = FirebaseStorage.instance;

  late String frontNetwork = '';
  late String backNetwork = '';

  Future<void> getUrl(cnicNumber) async {
    final backRef =
        downloadRef.ref().child("images/cnicBack/${cnicNumber}_cnic_back.jpeg");
    final frontRef = downloadRef
        .ref()
        .child("images/cnicFront/${cnicNumber}_cnic_front.jpeg");

    frontNetwork = await frontRef.getDownloadURL();
    backNetwork = await backRef.getDownloadURL();
    // log('${await backRef.getDownloadURL()}');
    userService.frontNetworkUrl = frontNetwork;
    userService.backNetworkUrl = backNetwork;
    notifyListeners();
  }

  // Future<void> getBarUrl() async {
  //   final frontRef = downloadRef.ref().child(
  //       "images/barFront/${FirebaseAuth.instance.currentUser!.uid}_bar_front.jpeg");
  //   final backRef = downloadRef.ref().child(
  //       "images/barBack/${FirebaseAuth.instance.currentUser!.uid}_bar_back.jpeg");

  //   frontBarNetwork = await frontRef.getDownloadURL();
  //   backBarNetwork = await backRef.getDownloadURL();

  //   userService.barFrontNetworkUrl = frontBarNetwork;
  //   userService.barBackNetworkUrl = backBarNetwork;
  //   log(userService.barBackNetworkUrl!);
  //   log(userService.barFrontNetworkUrl!);
  //   notifyListeners();
  // }

  navigateToMenuMain() async {
    // addBack();
    setBusy(true);
    snackbarService.showSnackbar(
        message: 'Wait for a while',
        duration: const Duration(seconds: 3),
        title: 'Hold');
    await Future.delayed(const Duration(seconds: 8));
    await setBool();
    await getUrl(userService.cnicNumber);
    await userService.addClientinClient(false);
    await userService.addClientinUser(false);
    snackbarService.showSnackbar(
        message: 'Back side of CNIC uploaded successfully',
        duration: const Duration(seconds: 2),
        title: 'Success');
    await Future.delayed(const Duration(seconds: 2));
    setBusy(false);
    navigationService.replaceWithMainMenuView();
  }
}
