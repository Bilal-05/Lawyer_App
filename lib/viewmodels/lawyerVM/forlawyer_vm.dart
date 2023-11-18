// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LawyerVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final textFieldService = locator<TextFieldService>();
  final navigationService = locator<NavigationService>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');

  Widget phoneNumberField() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
      },
      onInputValidated: (bool value) {
        print(value);
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

  navigateToCnic() {
    navigationService.navigateToCnicView();
  }
}
