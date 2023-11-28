// ignore_for_file: avoid_print
// import 'dart:developer';

import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LawyerVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final textFieldService = locator<TextFieldService>();
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
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
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

  add() {
    userService.phoneNumber = numberText;
    userService.fname = fnameController.text;
    userService.lname = lnameController.text;
    notifyListeners();
    log(userService.phoneNumber.toString());
  }

  navigateToCnic() async {
    if (formKey.currentState!.validate() && correctNumber) {
      await add();
      clear();
      navigationService.replaceWithCnicView();
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
