import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/views/directory_view/widgets/selected_value.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DirectoryVM extends BaseViewModel {
  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();
  final AppBarService appbarService = AppBarService();
  final bottomSheetService = BottomSheetService();
  List? alllawyer = [];
  List? foundItems = [];
  String star = 'assets/images/Star.png';
  bool showFilter = false;
  bool? isFavorite;
  List list = ['Area of Practice'];
  List<String>? practiceArea;
  String selectedArea = 'Area of Practice';
  var selectedIndex = 0;

  List<Widget> buildTimingItem() {
    return userService.practiceArea
        .map((val) => MySelectionItem(
              title: val,
              isForList: true,
            ))
        .toList();
  }

  setIndex(value) {
    selectedIndex = value;
    selectedArea = userService.practiceArea[value];
    notifyListeners();
  }

  var filterButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  filterExperience() {
    var results = alllawyer;
    results!.sort((a, b) => a['experience'].compareTo(b['experience']));
    foundItems = results;
    showFilter = !showFilter;
    notifyListeners();
  }

  filterFreeConsultation() {
    var results = alllawyer!
        .where((element) => element["freeConsultation"]
            .toString()
            .toLowerCase()
            .contains('yes'))
        .toList();
    foundItems = results;
    showFilter = !showFilter;
    notifyListeners();
  }

  filterByArea() {
    log(selectedArea);
    if (selectedArea == 'Area of Practice') {
      DialogService().showDialog(
        title: 'Error',
        description: 'Please select an area of practice',
        buttonTitle: 'Ok',
      );
    } else {
      var results = alllawyer!
          .where((element) => element["practiceArea"]
              .toString()
              .toLowerCase()
              .contains(selectedArea.toLowerCase()))
          .toList();
      foundItems = results;
      showFilter = !showFilter;
      // log(foundItems.toString());
      notifyListeners();
    }
  }

  clearFilter() {
    foundItems = alllawyer;
    showFilter = !showFilter;
    selectedIndex = 0;
    notifyListeners();
  }

  filterFees() {
    var results = alllawyer;
    results!.sort((a, b) => a['hourlyRate'].compareTo(b['hourlyRate']));
    foundItems = results;
    showFilter = !showFilter;
    notifyListeners();
  }

  filterRating() {
    var results = alllawyer;
    results!.sort((a, b) => b['rating'].compareTo(a['rating']));
    foundItems = results;
    showFilter = !showFilter;
    notifyListeners();
  }

  addToFavorite(uid) {
    isFavorite = !isFavorite!;
    notifyListeners();
  }

  CollectionReference lawyers =
      FirebaseFirestore.instance.collection('lawyers');

  initialize() {
    alllawyer = userService.allLawyersData;
    foundItems = alllawyer;
    isFavorite = false;
    for (int i = 0; i < userService.practiceAreas!.length; i++) {
      list.add(userService.practiceAreas![i]['area']);
    }
    userService.practiceArea = list.cast<String>();
    log(userService.practiceArea.toString());
    notifyListeners();
  }

  openSheet() {
    // log(practiceArea!.length.toString());
    showFilter = !showFilter;
    notifyListeners();
  }

  search(value) {
    List results = [];
    var value1 = value.toLowerCase();
    notifyListeners();
    if (value.isEmpty) {
      results = alllawyer!;
      foundItems = results;
      notifyListeners();
    } else {
      results = alllawyer!
          .where((element) =>
              element["fullName"].toString().toLowerCase().contains(value1) ||
              element['practiceArea']
                  .toString()
                  .toLowerCase()
                  .contains(value1) ||
              element["designation"]
                  .toString()
                  .toLowerCase()
                  .contains(value1) ||
              element["rating"].toString().contains(value1))
          .toList();
      foundItems = results;
      notifyListeners();
    }
  }

  navigateToProfile(lawyerUId) {
    navigationService.navigateToProfileView(lawyerUid: lawyerUId);
  }
}
