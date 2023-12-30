import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:lawyer_app/services/notification_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResponseVM extends BaseViewModel {
  final user = FirebaseAuth.instance.currentUser;
  final appbarService = AppBarService();
  final navigationService = locator<NavigationService>();
  final notification = NotificationService();

  List<String> finalDate = [];
  List<String> finalTime = [];

  goBack() {
    navigationService.back();
  }

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(150, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  Future<void> deleteResponse(Map userData) async {
    log('inside');
    // CollectionReference sendResponse =
    //     FirebaseFirestore.instance.collection('sendResponse');

    // Call the user's CollectionReference to add a new user
    final user = FirebaseAuth.instance.currentUser;
    return FirebaseFirestore.instance
        .collection('sendResponse')
        .doc(user!.uid)
        .collection('responses')
        .doc(userData['uid'])
        .delete()
        .then(
          (value) => log("responseDeleted"),
        )
        .catchError(
      (error) {
        SnackbarService().showSnackbar(
          message: error,
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      },
    );
  }

 
}
