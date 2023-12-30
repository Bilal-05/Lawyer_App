import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:lawyer_app/services/notification_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;

class RequestVM extends BaseViewModel {
  final appbarService = AppBarService();
  final navigation = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  final userService = locator<UserService>();
  final snackbarService = locator<SnackbarService>();
  NotificationService notificationService = NotificationService();
  List totalMeeting = [];
  List finalTime = [];
  List finalDate = [];

  CollectionReference meeting =
      FirebaseFirestore.instance.collection('meeting');

  final reasonController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(150, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  sendNotification(clientDeviceToken) async {
    log(clientDeviceToken);
    notificationService.getNotificationToken().then((value) async {
      var data = {
        'to': clientDeviceToken,
        'priority': 'high',
        'notification': {
          'title': 'New Reponse',
          'body':
              'You have got a reponse from ${userService.userData['fullName']}',
        },
        'data': {
          'type': 'response',
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

  splitDateandTime(Map userData) {
    var time = userData['time'];
    var date = userData['date'];

    var replace =
        time.replaceAll('AM', '').replaceAll('PM', '').replaceAll(':00', '');

    var split = replace.split('-');

    for (var i = 0; i < split.length; i++) {
      finalTime.add(split[i].trim());
    }

    var dateSplit = date.split('-');

    for (var i = 0; i < dateSplit.length; i++) {
      finalDate.add(dateSplit[i].trim());
    }
    notifyListeners();

    debugPrint(finalDate.toString());
    debugPrint(finalTime.toString());
  }

  CollectionReference lawyers =
      FirebaseFirestore.instance.collection('lawyers');
  CollectionReference sendRequest =
      FirebaseFirestore.instance.collection('sendRequest');
  CollectionReference requests =
      FirebaseFirestore.instance.collection('requests');

  List<String> responses = ['Accept', 'Reject'];

  String? selectedResponse;

  Widget dropDownResponse() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'Select',
          style: Style.regular16ptb,
        ),
        items: responses
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item,
                      style: Style.regular14ptb.copyWith(fontSize: 12.sp)),
                ))
            .toList(),
        value: selectedResponse,
        onChanged: (String? value) {
          selectedResponse = value;
          notifyListeners();
          // rebuildUi();
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
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

  response(uid, Map userData) async {
    if (selectedResponse == 'Accept') {
      sendResponesTo(uid, userData);
      addMeetingLawyer(userData);
      addMeetingClient(uid);
      snackbarService.showSnackbar(
        message: 'Accepted',
        duration: const Duration(seconds: 1),
      );
      await sendNotification(userData['deviceToken']);
      deleteRequest(uid, userData);
    } else if (selectedResponse == 'Reject') {
      if (formKey.currentState!.validate()) {
        sendResponesTo(uid, userData);
        await sendNotification(userData['deviceToken']);
        deleteRequest(uid, userData);
        snackbarService.showSnackbar(
          message: 'Rejected',
          duration: const Duration(seconds: 1),
        );
      }
    } else {
      SnackbarService().showSnackbar(
        title: 'Error',
        message: 'Select Response',
        duration: const Duration(seconds: 1),
      );
    }
  }

  Future<void> sendResponesTo(uid, Map userData) async {
    log('inside');
    CollectionReference sendResponse =
        FirebaseFirestore.instance.collection('sendResponse');

    // Call the user's CollectionReference to add a new user
    final user = FirebaseAuth.instance.currentUser;
    return sendResponse
        .doc(uid)
        .collection('responses')
        .doc(user!.uid)
        .set(
          {
            'response': {
              'description': userData['description'],
              'date': userData['date'],
              'time': userData['time'],
              'lawyerName': userService.userData['fullName'],
              // 'userType': userData['userType'],
              'response': selectedResponse,
              'reason': reasonController.text == ''
                  ? 'No Reason'
                  : reasonController.text,
              'uid': user.uid,
            },
          },
        )
        .then(
          (value) => log("responseAdded"),
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

  Future<void> addMeetingLawyer(Map userData) async {
    CollectionReference meeting =
        FirebaseFirestore.instance.collection('meeting');
    final user = FirebaseAuth.instance.currentUser;
    DocumentReference docRef = meeting.doc(user!.uid);
    DocumentSnapshot doc = await docRef.get();

    var currentMeeting = [
      {
        'description':
            'Case Appointment with ${userData['clientName']} (Client)',
        'year': finalDate[2],
        'month': finalDate[1],
        'day': finalDate[0],
        'startTime': finalTime[0],
        'endTime': finalTime[1],
      },
    ];

    if (doc.exists) {
      return docRef
          .update(
            {
              'meeting': FieldValue.arrayUnion(
                currentMeeting,
              )
            },
          )
          .then(
            (value) => log("Meeting Added"),
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
    } else {
      return meeting
          .doc(user.uid)
          .set(
            {
              'meeting': currentMeeting,
            },
          )
          .then(
            (value) => log("Meeting Added"),
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
  }

  Future<void> addMeetingClient(uid) async {
    CollectionReference meeting =
        FirebaseFirestore.instance.collection('meeting');

    // return meeting
    //     .doc(uid)
    //     .set(
    //       {
    //         'meeting': {
    //           'description':
    //               'Appointment with ${userService.userData['fullName']}',
    //           'year': finalDate[2],
    //           'month': finalDate[1],
    //           'day': finalDate[0],
    //           'startTime': finalTime[0],
    //           'endTime': finalTime[1],
    //         },
    //       },
    //     )
    //     .then(
    //       (value) => log("Meeting Added"),
    //     )
    //     .catchError(
    //       (error) {
    //         snackbarService.showSnackbar(
    //           message: error,
    //           title: 'Error',
    //           duration: const Duration(seconds: 2),
    //         );
    //       },
    //     );
    DocumentReference docRef = meeting.doc(uid);
    DocumentSnapshot doc = await docRef.get();

    var currentMeeting = [
      {
        'description':
            'Case Appointment with ${userService.userData['fullName']} (Lawyer)',
        'year': finalDate[2],
        'month': finalDate[1],
        'day': finalDate[0],
        'startTime': finalTime[0],
        'endTime': finalTime[1],
      },
    ];

    if (doc.exists) {
      return docRef
          .update(
            {
              'meeting': FieldValue.arrayUnion(
                currentMeeting,
              )
            },
          )
          .then(
            (value) => log("Client Unioned"),
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
    } else {
      return meeting
          .doc(uid)
          .set(
            {
              'meeting': currentMeeting,
            },
          )
          .then(
            (value) => log("Client Added"),
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
  }

  Future<void> deleteRequest(uid, Map userData) async {
    log('inside');
    CollectionReference sendRequest =
        FirebaseFirestore.instance.collection('sendRequest');

    // Call the user's CollectionReference to add a new user
    final user = FirebaseAuth.instance.currentUser;
    return sendRequest
        .doc(user!.uid)
        .collection('requests')
        .doc(userData['uid'])
        .delete()
        .then(
          (value) => log("requestDeleted"),
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
}
