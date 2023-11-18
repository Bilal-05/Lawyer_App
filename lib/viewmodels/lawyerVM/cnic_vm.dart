// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

class CnicVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final textFieldService = locator<TextFieldService>();
  final navigationService = locator<NavigationService>();
  final nameController = TextEditingController();
  final cnicController = TextEditingController();
  final dobController = TextEditingController();
  final doiController = TextEditingController();
  final doeController = TextEditingController();

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(160, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  var b2style = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    fixedSize: const Size(160, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    side: BorderSide(color: AppColors.primaryColor, width: 1),
  );

  var b3style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  Widget dateTextField(
    TextEditingController dateInput,
    BuildContext context,
    String labelText,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: dateInput,
      //editing controller of this TextField
      decoration: InputDecoration(
        filled: true,
        prefixIcon: const Icon(Icons.calendar_today), //icon of text field
        hintText: labelText,
        suffixIcon: IconButton(
          onPressed: () => dateInput.clear(),
          icon: const Icon(Icons.clear),
        ),
        fillColor: const Color(0xff626262).withOpacity(0.10),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: const Color(0xff626262).withOpacity(0.10),
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 3,
          ),
        ),
      ),
      readOnly: true,
      //set it true, so that user will not able to edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16

          dateInput.text = formattedDate; //set output date to TextField value
          notifyListeners();
          rebuildUi();
        } else {}
      },
      validator: validator,
    );
  }

  navigateToScanView() {
    navigationService.navigateToUploadCnicView();
  }
}
