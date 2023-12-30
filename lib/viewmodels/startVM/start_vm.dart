// ignore_for_file: file_names

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/notification_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartVM extends BaseViewModel {
  String personLaptop = 'assets/images/welcomeImage.png';
  final navigationService = locator<NavigationService>();
  String google = 'assets/svg/google.svg';
  bool isLogin = false;
  bool firstLogin = true;
  bool getFirstlogin = true;
  NotificationService notificationService = NotificationService();
  final UserService userService = locator<UserService>();

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  var b2style = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xffECECEC),
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  isLoggedin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
    final user = FirebaseAuth.instance.currentUser;
    await prefs.setString('documentID', user!.uid.toString());
    getFirstlogin = prefs.getBool('firstLogin') ?? firstLogin;
    if (getFirstlogin == true) {
      await prefs.setBool('firstLogin', true);
    }
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

  initialize(BuildContext context) {
    fetchData();
    notificationService.requestNotificationPermission();
    // notificationService.isRefreshToken();
    notificationService.firebaseInit(context);
    notificationService.setupInteractMethod(context);
    notificationService.getNotificationToken().then((value) {
      log(value);
      userService.deviceToken = value.toString();
      debugPrint(userService.deviceToken!);
    });
  }

  googleSignIn() async {
    setBusy(true);
    await signInWithGoogle();
    Future.delayed(const Duration(seconds: 2), () {
      setBusy(false);
    });
    log('done');
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    if (googleAuth == null) {
      return;
    }
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

    // navigationService.replaceWithView();
    navigateToView();
  }

  navigateToView() {
    isLoggedin();
    navigationService.navigateToOnBoardingView();
  }

  navigateToLogin() {
    navigationService.navigateToLoginView();
  }

  navigateToRegister() {
    navigationService.navigateToRegisterView();
  }
}
