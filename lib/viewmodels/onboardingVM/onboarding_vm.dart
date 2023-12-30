// import 'dart:developer';

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardingVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  String? documentID;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  initialize() async {
    final user = FirebaseAuth.instance.currentUser;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // documentID = prefs.getString('documentID') ?? ;
    documentID = user!.uid.toString();
    notifyListeners();
  }

  setBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstLogin', false);
    // firstLogin = prefs.getBool('firstLogin');
    log(prefs.getBool('firstLogin').toString());
    notifyListeners();
  }

  String looking = 'assets/JSON/Looking.json';
  String skip = 'assets/JSON/Skip.json';
  List<String> items = [
    'I am looking for lawyers',
    'I am looking for clients',
  ];

  String? selectedValue;

  Widget dropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'I am looking for...',
          style: Style.regular16ptb,
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: Style.regular16ptb),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          selectedValue = value;
          notifyListeners();
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff626262).withOpacity(0.10),
          ),
          height: 50,
          width: 1.sw,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 50,
        ),
      ),
    );
  }

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  // one once yeh screen dikhani hai
  // depending on user input

  navigateToMainMenu() {
    setBool();
    navigationService.navigateToMainMenuView();
  }

  navigateToOnBoardingView() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('onBoardComplete', true);
    // log(prefs.getBool('onBoardComplete').toString());
    if (selectedValue == 'I am looking for lawyers') {
      userService.userType = 'client';
      prefs.setString('userType', 'client');
      navigationService.navigateToLawyerView();
    } else if (selectedValue == 'I am looking for clients') {
      userService.userType = 'lawyer';
      prefs.setString('userType', 'lawyer');
      navigationService.navigateToClientView();
    }
    return null;
  }
}
