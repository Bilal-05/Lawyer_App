import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'dart:convert';

class ForAppointmentVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  // final textFieldService = locator<TextFieldService>();
  final navigationService = locator<NavigationService>();
  UserService userService = locator<UserService>();
  final snackbarService = locator<SnackbarService>();
  TextEditingController practiceController = TextEditingController();
  TextEditingController consultantController = TextEditingController();
  TextEditingController hourlyController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // List<String> practiceArea = [
  //   'Yes',
  //   'No ',
  // ];

  // String? selectedPracticeArea;

  // Widget dropDownArea() {
  //   return DropdownButtonHideUnderline(
  //     child: DropdownButton2<String>(
  //       style: TextStyle(
  //         color: AppColors.primaryColor,
  //       ),
  //       isDense: true,
  //       hint: Text(
  //         'Do you provide free consultation?',
  //         style: Style.regular16ptb,
  //       ),
  //       items: practiceArea
  //           .map((String item) => DropdownMenuItem<String>(
  //                 value: item,
  //                 child: Text(item, style: Style.regular16ptb),
  //               ))
  //           .toList(),
  //       value: selectedPracticeArea,
  //       onChanged: (String? value) {
  //         selectedPracticeArea = value;
  //         notifyListeners();
  //         // rebuildUi();
  //       },
  //       buttonStyleData: ButtonStyleData(
  //         padding: const EdgeInsets.only(
  //           left: 15,
  //           right: 15,
  //         ),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           color: const Color(0xff626262).withOpacity(0.10),
  //         ),
  //         height: 60,
  //         width: 1.sw,
  //       ),
  //       menuItemStyleData: const MenuItemStyleData(
  //         height: 50,
  //       ),
  //     ),
  //   );
  // }

  List<String> items = [
    'Yes',
    'No ',
  ];

  String? selectedValue;

  Widget dropDownConsultation() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'Do you provide free consultation?',
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

  static List practiceAreas = [
    Areas(id: 1, name: "Family"),
    Areas(id: 2, name: "Banking and Debt Finance"),
    Areas(id: 3, name: "Commerical"),
    Areas(id: 4, name: "Construction"),
    Areas(id: 5, name: "Civil Litigation and Dispute Resolution"),
    Areas(id: 6, name: "Charity"),
    Areas(id: 7, name: "Consumer"),
    Areas(id: 8, name: "Corporate"),
    Areas(id: 9, name: "Criminal"),
    Areas(id: 10, name: "Employment"),
    Areas(id: 11, name: "Environmental"),
    Areas(id: 12, name: "Hosuing"),
    Areas(id: 13, name: "Human Rights"),
    Areas(id: 14, name: "Immigration and Asylum"),
    Areas(id: 15, name: "Insurance"),
    Areas(id: 16, name: "Intellectual Property"),
    Areas(id: 17, name: "Personal Injury and Clinical Negligence"),
    Areas(id: 18, name: "Private Client"),
    Areas(id: 19, name: "Property"),
    Areas(id: 20, name: "Public Companies and Equity Finance"),
    Areas(id: 21, name: "Tax"),
    Areas(id: 22, name: "Restructuring and Insolvency"),
    Areas(id: 23, name: "Shipping and Transport"),
    Areas(id: 24, name: "Social Welfare"),
  ];

  final List selectedAreas = [];

  final _areas =
      practiceAreas.map((area) => MultiSelectItem(area, area.name!)).toList();
  //List<Animal> _selectedpracticeAreas = [];
  List selectedArea = [];

  Widget area() {
    return MultiSelectChipField(
      items: _areas,
      initialValue: selectedArea,
      title: Text(
        "Select Practice Areas",
        style: Style.regular16ptw,
      ),
      headerColor: AppColors.primaryColor,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 1.8),
      ),
      selectedChipColor: AppColors.primaryColor,
      selectedTextStyle: Style.regular14ptb.copyWith(
        color: Colors.white,
      ),
      onTap: (values) {
        selectedAreas.clear();
        selectedArea = values;
        notifyListeners();
        log(selectedArea.toString());
        for (int i = 0; i < selectedArea.length; i++) {
          var name = selectedArea[i].name;
          selectedAreas.add(name);
          log(name);
        }
        log(selectedArea.toString());
        for (int i = 0; i < selectedAreas.length; i++) {
          log(selectedAreas[i].toString());
        }
      },
    );
  }

  Widget practiceArea() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'Do you provide free consultation?',
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
    // var areas = practiceController.text;
    // var area = areas.split(',');
    // var practiceArea = [];
    // log(area.toString());
    // log(area.length.toString());
    // for (int i = 0; i < area.length; i++) {
    //   practiceArea.add(area[i].trim());
    // }
    // log(practiceArea.toString());
    // log(practiceArea.length.toString());
    // for (int i = 0; i < practiceArea.length; i++) {
    //   log(practiceArea[i].toString());
    // }
    // log(practiceAreas.toString());
    log(selectedAreas.toString());

    userService.practiceArea = selectedAreas;
    for (var i in userService.practiceArea) {
      log(i);
    }
    userService.freeConsultation = selectedValue;
    userService.hourlyRate = hourlyController.text;
    userService.address = locationController.text;
    notifyListeners();
  }

  navigateToExperience() {
    if (formKey.currentState!.validate()) {
      if (selectedArea.isNotEmpty) {
        add();
        navigationService.navigateToExperienceView();
      } else {
        snackbarService.showSnackbar(
            message: 'Select atleast one area',
            title: "Error",
            duration: const Duration(seconds: 2));
      }
    } else {
      snackbarService.showSnackbar(
          message: 'Fill all fields',
          title: "Error",
          duration: const Duration(seconds: 2));
    }
  }
}

class Areas {
  final int? id;
  final String? name;

  Areas({
    this.id,
    this.name,
  });
}
