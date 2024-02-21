// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'dart:io';

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
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClientVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  // final textFieldService = locator<TextFieldService>();
  final navigationService = locator<NavigationService>();
  final UserService userService = locator<UserService>();
  final dialogService = locator<DialogService>();
  final imagePicker = locator<ImageHelperService>();
  final snackbarService = locator<SnackbarService>();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  final storageRef = FirebaseStorage.instance.ref();

  File? profileImage;

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  openCamera() async {
    final XFile? file = await imagePicker.pickImage();
    if (file != null) {
      final croppedFile = await imagePicker.crop(
        file: file,
        cropStyle: CropStyle.circle,
      );
      if (croppedFile != null) {
        profileImage = File(croppedFile.path);
        notifyListeners();
      }
    }
  }

  openGallery() async {
    final XFile? file = await imagePicker.pickImageFromGallery();
    if (file != null) {
      final croppedFile = await imagePicker.crop(
        file: file,
        cropStyle: CropStyle.circle,
      );
      if (croppedFile != null) {
        profileImage = File(croppedFile.path);
        notifyListeners();
      }
    }
  }

  getProfileImage() async {
    await dialogService
        .showConfirmationDialog(
      title: 'Profile Photo',
      description: 'Please select a profile photo',
      cancelTitle: 'Gallery',
      confirmationTitle: 'Camera',
    )
        .then(
      (value) {
        if (value != null) {
          if (value.confirmed) {
            openCamera();
          } else {
            openGallery();
          }
        } else {}
      },
    );

    if (profileImage != null) {
      await addDP();
    }
  }

  saveProfilePhoto() async {
    UploadTask uploadTask = storageRef
        .child('images/DP/${FirebaseAuth.instance.currentUser!.uid}.jpeg')
        .putFile(profileImage!, SettableMetadata(contentType: 'image/jpeg'));
    log('Done');
    notifyListeners();
  }

  String? profileNetworkUrl;

  getProfileUrl() async {
    final profileRef = storageRef
        .child("images/DP/${FirebaseAuth.instance.currentUser!.uid}.jpeg");

    await Future.delayed(const Duration(seconds: 5));
    profileNetworkUrl = await profileRef.getDownloadURL();

    userService.profilePhotoNetworkUrl = profileNetworkUrl;
    notifyListeners();
  }

  addDP() async {
    await saveProfilePhoto();
    userService.profilePhoto =
        'images/DP/${FirebaseAuth.instance.currentUser!.uid}.jpeg';
    notifyListeners();

    log(userService.profilePhoto ?? 'Error');
  }

  add() async {
    await addDP();
    await getProfileUrl();
    log(userService.profilePhotoNetworkUrl!);
    userService.fullName = fullnameController.text;
    userService.designation = designationController.text;
    userService.bio = bioController.text;
    notifyListeners();
  }

  navigateToEducation() {
    if (formKey.currentState!.validate()) {
      if (profileImage != null) {
        add();
        navigationService.replaceWithEducationView();
      } else {
        snackbarService.showSnackbar(
          message: "Please select a profile photo",
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      }
    } else {
      snackbarService.showSnackbar(
          message: "Please fill all the fields",
          title: 'Error',
          duration: const Duration(seconds: 2));
    }
  }
}
