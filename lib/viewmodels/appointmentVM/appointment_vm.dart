import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:lawyer_app/services/notification_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/views/directory_view/widgets/selected_value.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;

class AppointmentVM extends BaseViewModel {
  final appBarService = AppBarService();
  final navigationService = NavigationService();
  final descriptionController = TextEditingController();
  final userService = locator<UserService>();
  final formKey = GlobalKey<FormState>();
  final snackbarService = locator<SnackbarService>();
  NotificationService notificationService = NotificationService();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  goBack() {
    snackbarService.showSnackbar(
      title: 'Congralution 🎉',
      message: 'Request Sent',
      duration: const Duration(seconds: 2),
    );
    navigationService.replaceWithMainMenuView();
  }

  back() {
    navigationService.back();
  }

  List hour = [];
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

  sendNotification(lawyerDeviceToken, userData) async {
    log(lawyerDeviceToken);
    notificationService.getNotificationToken().then((value) async {
      var data = {
        'to': lawyerDeviceToken,
        'priority': 'high',
        'notification': {
          'title': 'New Request',
          'body':
              'You have a new appointment request from ${userData['fname'] ?? userData['fullName']}',
        },
        'data': {
          'type': 'request',
        }
      };
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'key=AAAAvOrBp2o:APA91bGiJLvPd8ruBb4eReJJOrUSMdDF7Ovs9sxBJpuSRTa06Rli9Ju6Yonyi6HGXRMwkRfYTvIT4JnPOfoV0mydCXH9219dxtg6n_zOY_aGBzbzEEvo05HwHnuXB7_HKY-2-BXbJNwG',
        },
      );
    });
  }

  setDate(date) {
    selectedDate = date;
    userService.selectedDate = DateFormat('dd-MM-yyyy').format(selectedDate!);
    log(userService.selectedDate.toString());
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
      userService.selectedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      log(userService.selectedDate!);
      resetMonth();
      log(selectedMonth!);
      log(DateTime.now().toString());
      log(initialDate.toString());
      notifyListeners();
    } else {}
  }

  initialize(timing) {
    //context) {
    hour = timing;
    userService.selectedTime = hour[0];
    userService.selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    log(userService.selectedTime!);
    log(userService.selectedDate!);
    init();
    notifyListeners();
    // notificationService.requestNotificationPermission();
    // // notificationService.isRefreshToken();
    // notificationService.firebaseInit(context);
    // notificationService.setupInteractMethod(context);
    // notificationService.getNotificationToken().then((value) {});
  }

  init() async {
    setBusy(true);
    await setMonth();
  }

  int selectedIndex = 0;
  String selectedSlot = '';

  List<Widget> buildTimingItem() {
    return hour
        .map((val) => MySelectionItem(
              title: val,
              isForList: true,
            ))
        .toList();
  }

  CollectionReference sendRequest =
      FirebaseFirestore.instance.collection('sendRequest');
  CollectionReference requests =
      FirebaseFirestore.instance.collection('requests');

  navigateToMainMenu() {
    navigationService.replaceWithMainMenuView();
  }

  // ignore: non_constant_identifier_names
  Future<void> sendRequestTo(String lawyer, userData) async {
    log('inside');
    // Call the user's CollectionReference to add a new user
    final user = FirebaseAuth.instance.currentUser;
    return sendRequest
        .doc(lawyer)
        .collection('requests')
        .doc(user!.uid)
        .set(
          {
            'request': {
              'clientName': userData['fullName'] ??
                  "${userData['fname']} ${userData['lname']}",
              // 'userType': userData['userType'],
              'description': descriptionController.text,
              'date': userService.selectedDate,
              'time': userService.selectedTime,
              'uid': user.uid,
              'deviceToken': userData['deviceToken'],
            },
          },
        )
        .then(
          (value) => log("requestAdded"),
        )
        .catchError(
          (error) {
            snackbarService.showSnackbar(
              message: error,
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
          },
        );
  }

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  setIndex(value) {
    selectedIndex = value;
    selectedSlot = hour[value];
    userService.selectedTime = selectedSlot;
    log(userService.selectedTime!);
    notifyListeners();
  }
}
