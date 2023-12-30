// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'dart:developer';

// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:lawyer_app/services/notification_service.dart';
// import 'package:lawyer_app/theme/colors.dart';
// import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/calendarVM/widgets/meeting.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarVM extends BaseViewModel {
  final appbarService = AppBarService();
  final navigate = locator<NavigationService>();
  CalendarView view = CalendarView.month;
  final notification = NotificationService();
  CalendarController calendarController = CalendarController();

  List<Meeting> meetings = [
    // Meeting('Conference 1', DateTime(2023, 12, 24, 9, 0, 0),
    //     DateTime(2023, 12, 24, 10, 0, 0), Colors.red, false),
  ];

  List<String> items = [];

  getMeeting(Map<String, dynamic> meetingData) async {
    if (meetings.isEmpty) {
      if (meetingData.isNotEmpty) {
        for (var i = 0; i < meetingData['meeting'].length; i++) {
          print(meetingData['meeting'][i]);
          meetings.add(
            Meeting(
              meetingData['meeting'][i]['description'],
              DateTime(
                int.parse(meetingData['meeting'][i]['year']).toInt(),
                int.parse(meetingData['meeting'][i]['month']).toInt(),
                int.parse(meetingData['meeting'][i]['day']).toInt(),
                int.parse(meetingData['meeting'][i]['startTime']).toInt(),
              ),
              DateTime(
                int.parse(meetingData['meeting'][i]['year']).toInt(),
                int.parse(meetingData['meeting'][i]['month']).toInt(),
                int.parse(meetingData['meeting'][i]['day']).toInt(),
                int.parse(meetingData['meeting'][i]['endTime']).toInt(),
              ),
              Colors.green,
              false,
            ),
          );
        }
      }
    }
  }

  CollectionReference meeting =
      FirebaseFirestore.instance.collection('meeting');
  final user = FirebaseAuth.instance.currentUser;

  // String? selectedValue;

  // Widget dropDown() {
  //   return DropdownButtonHideUnderline(
  //     child: DropdownButton2<String>(
  //       style: TextStyle(
  //         color: AppColors.primaryColor,
  //       ),
  //       isDense: true,
  //       hint: Text(
  //         'Select Year',
  //         style: Style.regular16ptb,
  //       ),
  //       items: items
  //           .map((String item) => DropdownMenuItem<String>(
  //                 value: item,
  //                 child: Text(item, style: Style.regular16ptb),
  //               ))
  //           .toList(),
  //       value: selectedValue,
  //       onChanged: (String? value) {
  //         selectedValue = value;
  //         notifyListeners();
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
  //         height: 50,
  //         width: 1.sw,
  //       ),
  //       menuItemStyleData: const MenuItemStyleData(
  //         height: 50,
  //       ),
  //     ),
  //   );
  // }

  setView(value) {
    if (value == 'month') {
      view = CalendarView.month;
      calendarController.view = CalendarView.month;
      notifyListeners();
    } else if (value == 'week') {
      view = CalendarView.week;
      calendarController.view = CalendarView.week;
      notifyListeners();
    } else if (value == 'day') {
      view = CalendarView.day;
      calendarController.view = CalendarView.day;
      notifyListeners();
    }
  }

  goBack() {
    navigate.back();
  }
}

// List<Meeting> getDataSource() {
//   final List<Meeting> meetings = <Meeting>[];
//   final DateTime today = DateTime.now();
//   final DateTime startTime = DateTime(
//     today.year,
//     today.month,
//     today.day,
//     9,
//     0,
//     0,
//   );
//   final DateTime endTime = startTime.add(
//     const Duration(hours: 2),
//   );
 
//   meetings.add(
//     Meeting('Conference 2', startTime.add(const Duration(hours: 3)),
//         endTime.add(const Duration(hours: 3)), Colors.blue, false),
//   );
//   meetings.add(
//     Meeting('Conference 3', startTime.add(const Duration(hours: 6)),
//         endTime.add(const Duration(hours: 6)), Colors.green, false),
//   );
//   return meetings;
// }
