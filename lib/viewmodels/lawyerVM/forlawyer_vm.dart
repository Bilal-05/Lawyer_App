// ignore_for_file: avoid_print
// import 'dart:developer';

import 'dart:developer';
import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/image_helper_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LawyerVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  // final textFieldService = locator<TextFieldService>();
  final snackBarService = locator<SnackbarService>();
  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  bool correctNumber = false;
  String numberText = '';
  final imagePicker = locator<ImageHelperService>();
  final dialogService = locator<DialogService>();

  Widget phoneNumberField() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
        numberText = number.phoneNumber.toString();
        notifyListeners();
      },
      onInputValidated: (bool value) {
        if (!value) {
          print('Invalid Number');
        } else {
          print(value);
          correctNumber = true;
          notifyListeners();
        }
      },
      hintText: '3XX-XXXXXXX',
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: number,
      textFieldController: phoneController,
      formatInput: true,
      keyboardType: TextInputType.phone,
      inputBorder: const OutlineInputBorder(),
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
      onFieldSubmitted: (value) {
        print(value);
        print(phoneController.text);
      },
      errorMessage: 'Invalid phone number',
    );
  }

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  clear() {
    fnameController.clear();
    lnameController.clear();
    phoneController.clear();
  }

  final storageRef = FirebaseStorage.instance.ref();

  File? profileImage;

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

    if (profileImage != null) {
      await addDP();
      await getProfileUrl();
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

    if (profileImage != null) {
      await addDP();
      await getProfileUrl();
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
    // ignore: unused_local_variable
    UploadTask uploadTask = storageRef
        .child('images/DP/${FirebaseAuth.instance.currentUser!.uid}.jpeg')
        .putFile(profileImage!, SettableMetadata(contentType: 'image/jpeg'));
    log('Done');
    notifyListeners();
  }

  String? profileNetworkUrl;

  getProfileUrl() async {
    snackBarService.showSnackbar(
      message: 'Uploading Image',
      title: 'Please wait..',
      duration: const Duration(seconds: 3),
    );
    setBusy(true);
    final profileRef = storageRef
        .child("images/DP/${FirebaseAuth.instance.currentUser!.uid}.jpeg");

    profileNetworkUrl = await profileRef.getDownloadURL();

    userService.profilePhotoNetworkUrl = profileNetworkUrl;
    notifyListeners();
    setBusy(false);
  }

  addDP() async {
    await saveProfilePhoto();
    userService.profilePhoto =
        'images/DP/${FirebaseAuth.instance.currentUser!.uid}.jpeg';
    notifyListeners();

    log(userService.profilePhoto ?? 'Error');
  }

  add() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 5));
    log(userService.profilePhotoNetworkUrl!);
    userService.phoneNumber = numberText;
    userService.fname = fnameController.text;
    userService.lname = lnameController.text;
    userService.email = FirebaseAuth.instance.currentUser!.email;
    notifyListeners();
    log(userService.phoneNumber.toString());
    setBusy(false);
  }

  navigateToCnic() async {
    if (formKey.currentState!.validate() && correctNumber) {
      if (profileImage != null) {
        await add();
        clear();
        navigationService.replaceWithCnicView();
      } else {
        snackBarService.showSnackbar(
          message: 'Please select a profile photo',
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      }
    } else {
      snackBarService.showSnackbar(
        message: 'Fill all fields',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
    }
    log(numberText);
  }
}
