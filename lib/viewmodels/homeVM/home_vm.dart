// import 'dart:developer';

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
// import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'package:stacked_services/stacked_services.dart';

class HomeVM extends BaseViewModel {
  final appbarService = locator<AppBarService>();
  final dialogService = locator<DialogService>();
  final navigationService = locator<NavigationService>();
  CollectionReference category =
      FirebaseFirestore.instance.collection('categories');

  String? documentID;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final storageRef = FirebaseStorage.instance;

  late String front = '';
  late String back = '';

  Map<String, dynamic> userData = {};

  showImage() {
    if (userData['userType'] == 'lawyer') {
      getBarUrl(FirebaseAuth.instance.currentUser!.uid);
    } else {
      getUrl(userData['cnicNumber']);
    }
  }

  Future<void> getUrl(cnicNumber) async {
    final backRef =
        storageRef.ref().child("images/cnicBack/${cnicNumber}_cnic_back.jpeg");
    final frontRef = storageRef
        .ref()
        .child("images/cnicFront/${cnicNumber}_cnic_front.jpeg");

    front = await frontRef.getDownloadURL();
    back = await backRef.getDownloadURL();

    notifyListeners();
  }

  Future<void> getBarUrl(cnicNumber) async {
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
    log(prefs.getBool('isLogin').toString());
    log(prefs.getBool('firstLogin').toString());
    log(prefs.getString('documentID').toString());
    prefs.remove('isLogin');
    prefs.remove('firstLogin');
    prefs.remove('documentID');
    notifyListeners();
    log(prefs.getBool('isLogin').toString());
    log(prefs.getBool('firstLogin').toString());
    log(prefs.getString('documentID').toString());
    navigationService.replaceWithStartView();
  }
}
