import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TimingVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  final textFieldService = locator<TextFieldService>();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final timeFromController = TextEditingController();
  final timeToController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');

  Widget phoneNumberField() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        log(number.phoneNumber.toString());
      },
      onInputValidated: (bool value) {
        log(value.toString());
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
        log('On Saved: $number');
      },
      onFieldSubmitted: (value) {
        log(value.toString());
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

  navigateToScanBarCard() {
    // if (formKey.currentState!.validate()) {
    navigationService.navigateToBarFrontView();
    // }
  }
}
