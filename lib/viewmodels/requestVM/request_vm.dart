import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RequestVM extends BaseViewModel {
  final appbarService = AppBarService();
  final navigation = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  final userService = locator<UserService>();
  final snackbarService = locator<SnackbarService>();

  final reasonController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(150, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  CollectionReference lawyers =
      FirebaseFirestore.instance.collection('lawyers');
  CollectionReference sendRequest =
      FirebaseFirestore.instance.collection('sendRequest');
  CollectionReference requests =
      FirebaseFirestore.instance.collection('requests');

  List<String> responses = ['Accept', 'Reject'];

  String? selectedResponse;

  Widget dropDownResponse() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'Select',
          style: Style.regular16ptb,
        ),
        items: responses
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item,
                      style: Style.regular14ptb.copyWith(fontSize: 12.sp)),
                ))
            .toList(),
        value: selectedResponse,
        onChanged: (String? value) {
          selectedResponse = value;
          notifyListeners();
          // rebuildUi();
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            color: const Color(0xff626262).withOpacity(0.10),
          ),
          height: 60,
          width: 1.sw,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 50,
        ),
      ),
    );
  }

  response(uid, Map userData) {
    if (selectedResponse == 'Accept') {
      sendResponesTo(uid, userData);
      deleteRequest(uid, userData);
      snackbarService.showSnackbar(
        message: 'Accepted',
        duration: const Duration(seconds: 1),
      );
    } else if (selectedResponse == 'Reject') {
      if (formKey.currentState!.validate()) {
        sendResponesTo(uid, userData);
        deleteRequest(uid, userData);
        snackbarService.showSnackbar(
          message: 'Rejected',
          duration: const Duration(seconds: 1),
        );
      }
    } else {
      SnackbarService().showSnackbar(
        title: 'Error',
        message: 'Select Response',
        duration: const Duration(seconds: 1),
      );
    }
  }

  Future<void> sendResponesTo(uid, Map userData) async {
    log('inside');
    CollectionReference sendResponse =
        FirebaseFirestore.instance.collection('sendResponse');

    // Call the user's CollectionReference to add a new user
    final user = FirebaseAuth.instance.currentUser;
    return sendResponse
        .doc(uid)
        .collection('responses')
        .doc(user!.uid)
        .set(
          {
            'response': {
              'description': userData['description'],
              'date': userData['date'],
              'time': userData['time'],
              'lawyerName': userService.userData['fullName'],
              // 'userType': userData['userType'],
              'response': selectedResponse,
              'reason': reasonController.text == ''
                  ? 'No Reason'
                  : reasonController.text,
            },
          },
        )
        .then(
          (value) => log("responseAdded"),
        )
        .catchError(
          (error) {
            snackbarService.showSnackbar(
              message: error,
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }

  Future<void> deleteRequest(uid, Map userData) async {
    log('inside');
    CollectionReference sendRequest =
        FirebaseFirestore.instance.collection('sendRequest');

    // Call the user's CollectionReference to add a new user
    final user = FirebaseAuth.instance.currentUser;
    return sendRequest
        .doc(user!.uid)
        .collection('requests')
        .doc(userData['uid'])
        .delete()
        .then(
          (value) => log("requestDeleted"),
        )
        .catchError(
      (error) {
        snackbarService.showSnackbar(
          message: error,
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      },
    );
  }
}
