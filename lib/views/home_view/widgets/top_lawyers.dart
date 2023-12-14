import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/homeVM/home_vm.dart';
import 'package:stacked/stacked.dart';

class TopLawyers extends StatelessWidget {
  const TopLawyers({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HomeVM(),
      builder: (context, vModel, child) {
        return StreamBuilder<QuerySnapshot>(
          stream: vModel.lawyers.snapshots(),
          builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(
                'Something went wrong',
                style: Style.semiBold14ptb,
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(
                color: AppColors.primaryColor,
              );
            }

            return SizedBox(
              // height: 0.5.sh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  DocumentSnapshot user = snapshot.data!.docs[index];

                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 0.015.sh),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: AppColors.greyShade,
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 0.02.sh,
                                  left: 0.02.sw,
                                  right: 0.02.sw,
                                ),
                                child: CircleAvatar(
                                  radius: 50.r,
                                  backgroundImage: NetworkImage(
                                    user['profilePhotoNetworkUrl'],
                                  ),
                                ),
                              ),
                              10.verticalSpace,
                              Container(
                                margin: EdgeInsets.only(bottom: 0.01.sh),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                      child: Image.asset(
                                        vModel.star,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    SizedBox(
                                      // margin: EdgeInsets.only(bottom: 0.01.sh),
                                      child: Text(
                                        user['rating'],
                                        style: Style.regular14ptb
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  user['fullName'],
                                  style: Style.semiBold20ptb,
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  user['designation'],
                                  style: Style.medium20ptb
                                      .copyWith(fontSize: 16.sp),
                                ),
                              ),
                              10.verticalSpace,
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    log(snapshot.data!.docs.length.toString());
                                    log(snapshot.data!.docs.toString());
                                  },
                                  child: Text(
                                    'Appointment',
                                    style: Style.semiBold20ptw,
                                  ))
                              // SizedBox(
                              //   child: Text(
                              //     "Practice Area:",
                              //     style: Style.medium14ptb,
                              //   ),
                              // ),
                              // for (int i = 0;
                              //     i < user['practiceArea'].length;
                              //     i++)
                              //   SizedBox(
                              //     child: Text(
                              //       user['practiceArea'][i],
                              //       style: Style.regular14ptb,
                              //     ),
                              //   ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        );
      },
    );
  }
}
