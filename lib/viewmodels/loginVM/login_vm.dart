import 'dart:developer';
// import 'dart:html';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginVM extends BaseViewModel {
  bool obscureText = true;
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
  final UserService userService = locator<UserService>();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String google = 'assets/svg/google.svg';
  final texttFieldService = locator<TextFieldService>();
  String? documentID;

  bool isLogin = false;
  bool firstLogin = true;

  clear() {
    emailController.clear();
    passController.clear();
    notifyListeners();
  }

  isLoggedin(UserCredential credential) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
    // if (prefs.getString('documentID') != credential.user!.uid.toString()) {
    await prefs.setString('documentID', credential.user!.uid.toString());
    //   await prefs.setBool('firstLogin', true);
    //   firstLogin = true;
    //   notifyListeners();
    // }
    log(prefs.getString('documentID')!);
    log(prefs.getBool('firstLogin').toString());
    // log("${prefs.getBool('isLogin')}");
    // log("${prefs.getBool('firstLogin')}");
    notifyListeners();
  }

  checkIsFirstLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    firstLogin = prefs.getBool('firstLogin') ?? firstLogin;
    log(firstLogin.toString());
    notifyListeners();
  }

  fetchData() async {
    await checkIsFirstLogin();
  }

  initialize() {
    fetchData();
  }

  login() {
    if (formKey.currentState!.validate()) {
      snackBarService.showSnackbar(
        message: 'Logging in...',
        title: 'Wait',
        duration: const Duration(seconds: 4),
      );
      emailLogin();
    } else {
      snackBarService.showSnackbar(
        message: 'Please enter valid email and password',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
    }
  }

  emailLogin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      isLoggedin(credential);
      Future.delayed(
        const Duration(milliseconds: 1500),
      );
      clear();
      navigateToView();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        snackBarService.showSnackbar(
          message: 'Invalid Credentials.',
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      } else if (e.code == 'network-request-failed') {
        snackBarService.showSnackbar(
          message: 'Network timeout.',
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
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

  navigateToForgotView() {
    navigationService.navigateToForgotSelectView();
  }

  navigateToRegisterView() {
    navigationService.replaceWithRegisterView();
  }

  // navigateToBoardingView() {
  //   // navigationService.navigateToOnBoardingView();
  //   navigationService.navigateToMainMenuView();
  // }

  navigateToView() {
    // if (firstLogin) {
    navigationService.replaceWithOnBoardingView();
    // } else {
    //   navigationService.replaceWithMainMenuView();
    // }
  }
}
