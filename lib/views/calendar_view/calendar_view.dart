import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
// import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/calendarVM/calendar_vm.dart';
// import 'package:lawyer_app/viewmodels/calendarVM/widgets/meeting.dart';
import 'package:lawyer_app/viewmodels/calendarVM/widgets/meeting_data.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SFCalendarView extends StatelessWidget {
  const SFCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CalendarVM(),
      // onViewModelReady: (viewModel) => viewModel.initialize(),
      builder: (context, vModel, child) {
        return FutureBuilder(
            future: vModel.meeting.doc(vModel.user!.uid).get(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Something went wrong',
                      style: Style.semiBold20ptb,
                    ),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data!.data() != null) {
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  vModel.getMeeting(data);
                }

                return Scaffold(
                  body: SafeArea(
                    child: Container(
                      margin: EdgeInsets.only(top: 0.02.sh),
                      child: Column(
                        children: [
                          vModel.appbarService.customAppBar(
                              'Calender',
                              IconButton(
                                onPressed: () {
                                  vModel.goBack();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              PopupMenuButton(onSelected: (value) {
                                vModel.setView(value);

                                // your logic
                              }, itemBuilder: (BuildContext bc) {
                                return [
                                  PopupMenuItem(
                                    value: 'month',
                                    child: Text(
                                      "Month View",
                                      style: Style.regular14ptb,
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'week',
                                    child: Text(
                                      "Week View",
                                      style: Style.regular14ptb,
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'day',
                                    child: Text(
                                      "Day View",
                                      style: Style.regular14ptb,
                                    ),
                                  )
                                ];
                              })),
                          Expanded(
                            child: SfCalendar(
                              view: vModel.view,
                              controller: vModel.calendarController,
                              // initialSelectedDate: DateTime.now(),
                              dataSource: MeetingDataSource(vModel.meetings),
                              cellBorderColor: AppColors.primaryColor,
                              selectionDecoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 2,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                shape: BoxShape.rectangle,
                              ),
                              monthViewSettings: const MonthViewSettings(
                                appointmentDisplayMode:
                                    MonthAppointmentDisplayMode.indicator,
                                showAgenda: true,
                                numberOfWeeksInView: 4,
                              ),
                              showTodayButton: true,
                              showNavigationArrow: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            });
      },
    );
  }
}

// floatingActionButton: Column(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     FloatingActionButton.small(
                  //       heroTag: 'add',
                  //       onPressed: () {
                  //         // showModalBottomSheet(
                  //         //   context: context,
                  //         //   builder: (context) {
                  //         //     return Container(
                  //         //       height: 500,
                  //         //       // color: AppColors.primaryColor,
                  //         //       child: Column(
                  //         //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         //         children: [
                  //         //           Container(
                  //         //             margin: EdgeInsets.only(top: 0.02.sh),
                  //         //             // width: 1.sw,
                  //         //             child: Center(
                  //         //               child:
                  //         //                   Text('Add Event', style: Style.medium20ptb
                  //         //                       // .copyWith(color: Colors.white),
                  //         //                       ),
                  //         //             ),
                  //         //           ),
                  //         //           20.verticalSpace,
                  //         //           // Container(
                  //         //           //   margin: EdgeInsets.only(
                  //         //           //       left: 0.02.sw, right: 0.02.sw),
                  //         //           //   child: vModel.dropDown(),
                  //         //           // )
                  //         //         ],
                  //         //       ),
                  //         //     );
                  //         //   },
                  //         // );
                  //         // log(DateTime().toString());
                  //       },
                  //       child: Icon(Icons.add, color: AppColors.primaryColor),
                  //     ),
                  //     FloatingActionButton.small(
                  //       heroTag: 'edit',
                  //       onPressed: () {
                  //         showModalBottomSheet(
                  //           context: context,
                  //           builder: (context) {
                  //             return Container(
                  //               height: 400,
                  //               color: AppColors.primaryColor,
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: Icon(Icons.edit, color: AppColors.primaryColor),
                  //     ),
                  //   ],
                  // ),