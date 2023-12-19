import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/profileVM/profile_vm.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  final String lawyerUid;
  const ProfileView({super.key, required this.lawyerUid});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ProfileVM(),
      // onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, vModel, child) {
        return FutureBuilder<DocumentSnapshot>(
          future: vModel.lawyers.doc(lawyerUid).get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text(
                    "Something went wrong",
                    style: Style.regular16ptb,
                  ),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = {};

              if (snapshot.data!.data() != null) {
                data = snapshot.data!.data() as Map<String, dynamic>;
                vModel.hours =
                    vModel.workingHours(data['startTime'], data['endTime']);
                vModel.await();
                // log(vModel.hours.toString());
              }
              // log('empty');

              return vModel.isBusy
                  ? Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                            10.verticalSpace,
                            Text(
                              'Loading...',
                              style: Style.regular16ptb,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Scaffold(
                      body: SafeArea(
                        child: SizedBox(
                          child: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 0.02.sh, left: 0.02.sw, right: 0.02.sw),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  vModel.appbarService.customAppBar(
                                    '',
                                    IconButton(
                                      onPressed: () {
                                        vModel.goBack();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    Container(),
                                  ),
                                  0.02.sh.verticalSpace,
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      // clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: SizedBox(
                                        height: 140.h,
                                        width: 140.w,
                                        // color: AppColors.primaryColor,
                                        child: Image.network(
                                          data['profilePhotoNetworkUrl'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Center(
                                    child: SizedBox(
                                      width: 0.8.sw,
                                      child: Text(
                                        data['fullName'],
                                        style: Style.medium20ptb,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Center(
                                    child: Text(
                                      data['designation'],
                                      style: Style.regular14ptb,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.01.sw,
                                      right: 0.01.sw,
                                    ),
                                    height: 120.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primaryColor,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 0.02.sw,
                                        // vertical: 0.02.sh,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 90.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${data['noOfWins']}+",
                                                  style: Style.semiBold20ptb
                                                      .copyWith(
                                                          fontSize: 20.sp),
                                                ),
                                                5.verticalSpace,
                                                Text('Wins',
                                                    style: Style.regular14ptb),
                                              ],
                                            ),
                                          ),
                                          5.horizontalSpace,
                                          Container(
                                            height: 90.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${data['experience']}+",
                                                  style: Style.semiBold20ptb
                                                      .copyWith(
                                                          fontSize: 20.sp),
                                                ),
                                                5.verticalSpace,
                                                Text('Exp. years',
                                                    style: Style.regular14ptb),
                                              ],
                                            ),
                                          ),
                                          5.horizontalSpace,
                                          Container(
                                            height: 90.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 15.w,
                                                      child: Image.asset(
                                                        vModel.star,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    5.horizontalSpace,
                                                    Text(
                                                      "${data['rating']}",
                                                      style: Style.semiBold20ptb
                                                          .copyWith(
                                                              fontSize: 20.sp),
                                                    ),
                                                  ],
                                                ),
                                                5.verticalSpace,
                                                Text(
                                                  'Rating',
                                                  style: Style.regular14ptb,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      // right: 0.01.sw,
                                    ),
                                    child: Text(
                                      'About Lawyer',
                                      style: Style.medium20ptb,
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      right: 0.02.sw,
                                    ),
                                    child: Text(
                                      data['bio'],
                                      style: Style.regular14ptb,
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      // right: 0.01.sw,
                                    ),
                                    child: Text(
                                      'Practice Areas:',
                                      style: Style.medium20ptb,
                                    ),
                                  ),
                                  5.verticalSpace,
                                  // Container(
                                  //   margin: EdgeInsets.only(
                                  //     left: 0.02.sw,
                                  //     right: 0.02.sw,
                                  //   ),
                                  //   child: Text(
                                  //     data['practiceArea']
                                  //         .toString()
                                  //         .replaceAll('[', '')
                                  //         .replaceAll(']', ''),
                                  //     style: Style.regular14ptb,
                                  //   ),
                                  // ),
                                  Container(
                                    // height: 0.5.sh,
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      right: 0.02.sw,
                                    ),
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: data['practiceArea'].length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                            "⚫ ${data['practiceArea'][index]}",
                                            style: Style.regular14ptb,
                                          );
                                        }),
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      // right: 0.01.sw,
                                    ),
                                    child: Text(
                                      'Availability:',
                                      style: Style.medium20ptb,
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      right: 0.02.sw,
                                    ),
                                    child: Text(
                                      data['availabileFrom'] +
                                          ' - ' +
                                          data['availabileTill'],
                                      style: Style.regular14ptb,
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      // right: 0.01.sw,
                                    ),
                                    child: Text(
                                      'Office Timing:',
                                      style: Style.medium20ptb,
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      right: 0.02.sw,
                                    ),
                                    child: Text(
                                      data['startTime'] +
                                          ' - ' +
                                          data['endTime'],
                                      style: Style.regular14ptb,
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      // right: 0.01.sw,
                                    ),
                                    child: Text(
                                      'Office Address:',
                                      style: Style.medium20ptb,
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      right: 0.02.sw,
                                    ),
                                    child: Text(
                                      data['address'],
                                      style: Style.regular14ptb,
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      // right: 0.01.sw,
                                    ),
                                    child: Text(
                                      'Do You provide free consultation:',
                                      style: Style.medium20ptb,
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 0.02.sw,
                                      right: 0.02.sw,
                                    ),
                                    child: Text(
                                      data['freeConsultation'],
                                      style: Style.regular14ptb,
                                    ),
                                  ),

                                  10.verticalSpace,
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: 0.01.sh,
                                      ),
                                      child: ElevatedButton(
                                        style: vModel.b1style,
                                        onPressed: () {
                                          vModel.navigateToAppointment(
                                              data, vModel.newHours);
                                        },
                                        child: Text('Book Appointment',
                                            style: Style.semiBold20ptw),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
            }

            // return CircularProgressIndicator(
            //   color: AppColors.primaryColor,
            // );
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                    10.verticalSpace,
                    Text(
                      'Loading...',
                      style: Style.regular16ptb,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
