import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactInfoVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
  final formKey = GlobalKey<FormState>();
  final userService = locator<UserService>();
  final textFieldService = locator<TextFieldService>();
  final emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  bool correctNumber = false;
  String numberText = '';

  Widget phoneNumberField() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        log(number.phoneNumber.toString());
      },
      onInputValidated: (bool value) {
        if (!value) {
          log('Invalid Number');
        } else {
          log(value.toString());
          correctNumber = true;
          numberText = number.phoneNumber.toString();
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
        log('On Saved: $number');
      },
      onFieldSubmitted: (value) {
        log(value.toString());
      },
      errorMessage: 'Invalid phone number',
    );
  }

  List<String> items = [
    'Yes',
    'No ',
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
          'Is the above number on Whatsapp?',
          style: Style.regular16ptb.copyWith(fontSize: 15.sp),
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
          // rebuildUi();
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
          height: 60,
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

  add() {
    userService.phoneNumber = numberText;
    userService.email = emailController.text;
    userService.whatsAppNumber = selectedValue;
  }

  navigateToScanView() {
    if (formKey.currentState!.validate() &&
        correctNumber &&
        selectedValue != null) {
      navigationService.navigateToBarFrontView();
    } else {
      snackBarService.showSnackbar(
        message: 'Fill all fields',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
    }
  }
}
