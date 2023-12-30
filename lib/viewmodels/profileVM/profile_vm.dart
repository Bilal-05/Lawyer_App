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

class ProfileVM extends BaseViewModel {
  final dialogService = DialogService();
  final navigationService = locator<NavigationService>();
  final appbarService = AppBarService();
  final userService = locator<UserService>();
  List hours = [];
  List newHours = [];
  List slots = [];

  String star = 'assets/images/Star.png';
  CollectionReference lawyers =
      FirebaseFirestore.instance.collection('lawyers');

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  goBack() {
    navigationService.back();
  }

  DateTime initialDate = DateTime.now();
  DateTime? selectedDate;
  String? selectedMonth;
  int monthNumber = DateTime.now().month;

  setMonth() {
    switch (monthNumber) {
      case 1:
        selectedMonth = 'January';
      case 2:
        selectedMonth = 'Februray';
      case 3:
        selectedMonth = 'March';
      case 4:
        selectedMonth = 'April';
      case 5:
        selectedMonth = 'May';
      case 6:
        selectedMonth = 'June';
      case 7:
        selectedMonth = 'July';
      case 8:
        selectedMonth = 'August';
      case 9:
        selectedMonth = 'September';
      case 10:
        selectedMonth = 'October';
      case 11:
        selectedMonth = 'November';
      case 12:
        selectedMonth = 'December';
      default:
        selectedMonth = 'Error';
    }
  }

  resetMonth() {
    switch (initialDate.month) {
      case 1:
        selectedMonth = 'January';
      case 2:
        selectedMonth = 'Februray';
      case 3:
        selectedMonth = 'March';
      case 4:
        selectedMonth = 'April';
      case 5:
        selectedMonth = 'May';
      case 6:
        selectedMonth = 'June';
      case 7:
        selectedMonth = 'July';
      case 8:
        selectedMonth = 'August';
      case 9:
        selectedMonth = 'September';
      case 10:
        selectedMonth = 'October';
      case 11:
        selectedMonth = 'November';
      case 12:
        selectedMonth = 'December';
      default:
        selectedMonth = 'Error';
    }
  }

  setDate(date) {
    selectedDate = date;
    log(selectedDate.toString());
    notifyListeners();
  }

  onTap(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: initialDate,
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      initialDate = pickedDate;
      resetMonth();
      log(selectedMonth!);
      log(DateTime.now().toString());
      log(initialDate.toString());
      notifyListeners();
    } else {}
  }

  init() async {
    setBusy(true);
    await setMonth();
  }

  navigateToAppointment(data, timing) {
    navigationService.navigateToAppointmentView(data: data, timing: timing);
  }

  int selectedIndex = 0;
  String selectedSlot = '';

  List<Widget> buildTimingItem() {
    return userService.slots!
        .map((val) => MySelectionItem(
              title: val,
              isForList: true,
            ))
        .toList();
  }

  await() async {
    await addSlot();
    // await Future.delayed(const Duration(seconds: 3));
    setBusy(false);
    rebuildUi();
  }

  setIndex(value) {
    selectedIndex = value;
    selectedSlot = userService.slots![value];
    notifyListeners();
  }

  List workingHours(start, end) {
    int sTime = int.parse(start.split(':')[0]);
    int eTime = int.parse(end.split(':')[0]);
    log("$sTime, $eTime");
    int endTime = eTime < 12 ? eTime + 12 : eTime;
    int startTime = sTime > 12 ? sTime - 12 : sTime;
    log('$startTime, $endTime');
    int hoursLeft = endTime - startTime + 1;
    List<String> hours = List.generate(hoursLeft, (i) => '${(endTime - i)}:00')
        .reversed
        .toList();

    log('Hours-------- $hours');
    return hours;
  }

  addAMPM() {
    for (var i = 0; i < hours.length; i++) {
      int time = int.parse(hours[i].split(':')[0]);

      if (time == 12) {
        hours[i] = '$time:00 PM';
      } else if (time > 12) {
        hours[i] = '${time - 12}:00 PM';
      } else {
        hours[i] = '$time:00 AM';
      }
    }
    log(hours.toString());
    newHours = hours;
    log(newHours.toString());
    notifyListeners();
  }

  addSlot() async {
    int count = 0;
    await addAMPM();
    for (var i = 0; i < newHours.length; i++) {
      // log("${newHours[i]} - ${newHours[i + 1]}");
      newHours[i] = '${newHours[i]} - ${newHours[i + 1]}';
      notifyListeners();
      count++;
      if (count == (newHours.length - 1)) {
        newHours.removeLast();
        notifyListeners();
        break;
      }
    }
    notifyListeners();
    rebuildUi();
    log("newhours: ${newHours.toString()}");
    userService.slots = newHours;
    notifyListeners();
  }
}
