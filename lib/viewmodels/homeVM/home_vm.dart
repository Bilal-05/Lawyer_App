// import 'dart:developer';

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
// import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'package:stacked_services/stacked_services.dart';

class HomeVM extends BaseViewModel {
  final appbarService = locator<AppBarService>();
  final dialogService = locator<DialogService>();
  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  CollectionReference category =
      FirebaseFirestore.instance.collection('categories');
  String star = 'assets/images/Star.png';

  String? documentID;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference lawyers =
      FirebaseFirestore.instance.collection('lawyers');

  final storageRef = FirebaseStorage.instance;

//
  Map<String, dynamic> userData = {};

  // saveData(Map<String, dynamic> data) {
  //   userData = data;
  //   // notifyListeners();
  // }

  showData() {
    log("userdata: ${userData.toString()}");
    log(userService.userData.toString());
  }

  showImage(userData) {
    if (userData['userType'] == 'lawyer') {
      getBarUrl();
      log('in lawyer');
    } else {
      getUrl(userData['cnicNumber']);
      log('in client');
    }
  }

  late String front = '';
  late String back = '';
  Future<void> getUrl(cnicNumber) async {
    final backRef =
        storageRef.ref().child("images/cnicBack/${cnicNumber}_cnic_back.jpeg");
    final frontRef = storageRef
        .ref()
        .child("images/cnicFront/${cnicNumber}_cnic_front.jpeg");

    front = await frontRef.getDownloadURL();
    back = await backRef.getDownloadURL();
    // log('${await backRef.getDownloadURL()}');

    notifyListeners();
  }

  navigateToProfile(lawyerUId) {
    navigationService.navigateToProfileView(lawyerUid: lawyerUId);
  }

  Future<void> getBarUrl() async {
    final frontRef = storageRef.ref().child(
        "images/barFront/${FirebaseAuth.instance.currentUser!.uid}_bar_front.jpeg");
    final backRef = storageRef.ref().child(
        "images/barBack/${FirebaseAuth.instance.currentUser!.uid}_bar_back.jpeg");

    front = await frontRef.getDownloadURL();
    back = await backRef.getDownloadURL();

    notifyListeners();
  }

  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    documentID = prefs.getString('documentID');
    // cnicFront = '';
    // cnicBack = '';
    // getUrl();
    notifyListeners();
  }

  setFalse() {
    // eraseData();
    // dialogService.showDialog(
    //     title: 'Logout',
    //     description: 'Are you sure you want to logout?',
    //     buttonTitle: 'Yes',
    //     cancelTitle: 'No',
    //     dialogPlatform: DialogPlatform.Material);
    //     if (dialogService. == true) {
    //       eraseData();
    //     }
    dialogService
        .showConfirmationDialog(
      title: 'Logout',
      description: 'Are you sure you want to logout?',
      cancelTitle: 'No',
      confirmationTitle: 'Yes',
    )
        .then((value) {
      if (value!.confirmed) {
        eraseData();
        log('erased');
      } else {
        log('not erased');
      }
    });
  }

  eraseData() async {
    FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    GoogleSignIn().signOut();
    log(prefs.getBool('isLogin').toString());
    log(prefs.getBool('firstLogin').toString());
    log(prefs.getString('documentID').toString());
    prefs.remove('isLogin');
    prefs.remove('firstLogin');
    prefs.remove('documentID');
    userService.userData = {};
    notifyListeners();
    log(prefs.getBool('isLogin').toString());
    log(prefs.getBool('firstLogin').toString());
    log(prefs.getString('documentID').toString());
    navigationService.replaceWithStartView();
  }
}
