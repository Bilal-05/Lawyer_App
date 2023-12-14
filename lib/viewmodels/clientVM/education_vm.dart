import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'dart:developer';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EducationVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  // final textFieldService = locator<TextFieldService>();
  final snackbarService = locator<SnackbarService>();
  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  TextEditingController institutionController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController doeController = TextEditingController();
  TextEditingController dogController = TextEditingController();

  List<String> institutes = [
    'Sindh Madressatul Islam University',
    'School of Law- University of Karachi',
    'Bahria University',
    'Dadabhoy Institute of Higher Education',
    'Institute of Business Management',
    'Sindh Muslim Law College',
    'Hamdard University',
    'Shaheed Zulfiqar Ali Bhutto, University of Law'
  ];

  List<String> degree = ['LLB', 'LLM', 'LLB, LLM'];

  String? selectedInstitute;
  String? selectedDegree;

  Widget dropDownInstitute() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'Where did you study?',
          style: Style.regular16ptb.copyWith(fontSize: 12.sp),
        ),
        items: institutes
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item,
                      style: Style.regular14ptb.copyWith(fontSize: 12.sp)),
                ))
            .toList(),
        value: selectedInstitute,
        onChanged: (String? value) {
          selectedInstitute = value;
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

  Widget dropDownDegree() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'What degree did you get?',
          style: Style.regular16ptb.copyWith(fontSize: 12.sp),
        ),
        items: degree
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item,
                      style: Style.regular16ptb.copyWith(fontSize: 12.sp)),
                ))
            .toList(),
        value: selectedDegree,
        onChanged: (String? value) {
          selectedDegree = value;
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
          log(pickedDate
              .toString()); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          log(formattedDate); //formatted date output using intl package =>  2021-03-16

          dateInput.text = formattedDate; //set output date to TextField value
          notifyListeners();
          rebuildUi();
        } else {}
      },
      validator: validator,
    );
  }

  add() {
    userService.institution = selectedInstitute;
    userService.degree = selectedDegree;
    userService.degreeYear = dogController.text;
    notifyListeners();
  }

  navigateToAppointmentView() {
    if (selectedInstitute != null || selectedDegree != null) {
      if (formKey.currentState!.validate()) {
        add();
        navigationService.navigateToForAppointmentView();
      } else {
        snackbarService.showSnackbar(
          message: 'Fill all fields',
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      }
    } else {
      snackbarService.showSnackbar(
        message: 'Fill all fields',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
    }
  }
}
