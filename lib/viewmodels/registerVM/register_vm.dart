import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/theme/colors.dart';
// import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  String google = 'assets/svg/google.svg';
  final texttFieldService = locator<TextFieldService>();

  clear() {
    emailController.clear();
    passController.clear();
    passConfirmController.clear();
    notifyListeners();
  }

  register() {
    if (formKey.currentState!.validate()) {
      snackBarService.showSnackbar(
        message: 'Registering...',
        title: 'Wait',
        duration: const Duration(seconds: 4),
      );
      registerUser();
    } else {
      snackBarService.showSnackbar(
        message: 'Please enter valid email and password',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
    }
  }

  registerUser() async {
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      await Future.delayed(
        const Duration(milliseconds: 100),
      );
      clear();
      snackBarService.showSnackbar(
        message: 'Account created successfully',
        title: 'Success',
        duration: const Duration(seconds: 2),
      );
      navigationService.navigateToLoginView();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBarService.showSnackbar(
          message: 'The password provided is too weak.',
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        snackBarService.showSnackbar(
          message: 'The account already exists for that email.',
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
        log('The account already exists for that email.');
      }
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
  }

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

  navigateToLoginView() {
    navigationService.replaceWithLoginView();
  }
}
