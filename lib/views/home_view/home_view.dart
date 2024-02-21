// import 'dart:io';

// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/homeVM/home_vm.dart';
import 'package:lawyer_app/views/home_view/widgets/categories.dart';
import 'package:lawyer_app/views/home_view/widgets/top_lawyers.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(context),
      viewModelBuilder: () => HomeVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 0.02.sh,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: vModel.appbarService.customAppBar(
                          'Home',
                          Container(),
                          Container(),
                        ),
                      ),
                      20.verticalSpace,
                      Container(
                        margin: EdgeInsets.only(left: 0.05.sw),
                        child: FutureBuilder<DocumentSnapshot>(
                          future: vModel.users
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .get(),
                          builder: (context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Scaffold(
                                body: Center(
                                  child: Text("Something went wrong"),
                                ),
                              );
                            }
                            
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              Map<String, dynamic> data = {};
                              if (snapshot.data!.data() != null) {
                                vModel.userData = snapshot.data!.data()
                                    as Map<String, dynamic>;
                                data = snapshot.data!.data()
                                    as Map<String, dynamic>;
                                vModel.userService.userData = snapshot.data!
                                    .data() as Map<String, dynamic>;
                              }

                              return data['userType'] == 'client'
                                  ? Text(
                                      'Hello ${data['fname']}',
                                      style: Style.semiBold20ptb,
                                    )
                                  : data['userType'] == 'lawyer'
                                      ? Text(
                                          'Hello ${data['fullName']}',
                                          style: Style.semiBold20ptb,
                                        )
                                      : Text(
                                          'Hello Sir/Madam,',
                                          style: Style.semiBold20ptb,
                                        );
                            }

                            return SizedBox(
                              child: Skeletonizer(
                                enabled: true,
                                containersColor: AppColors.primaryColor,
                                child: Container(
                                  width: 100.w,
                                  height: 20.h,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      5.verticalSpace,
                      Container(
                        margin: EdgeInsets.only(left: 0.05.sw),
                        width: 0.75.sw,
                        child: Text(
                          'Lets find,',
                          style: Style.bol30ptb.copyWith(fontSize: 25.sp),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 0.05.sw),
                        width: 0.75.sw,
                        child: Text(
                          'The best lawyer to help you out!',
                          style: Style.semiBold20ptb,
                        ),
                      ),
                      20.verticalSpace,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
                        child: Row(
                          children: [
                            Text(
                              'Categories',
                              style:
                                  Style.semiBold35ptb.copyWith(fontSize: 25.sp),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Text('See all', style: Style.regular16ptb),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 0.05.sw),
                          child: const Categories()),
                      20.verticalSpace,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
                        child: Row(
                          children: [
                            Text(
                              'Top Laywers',
                              style:
                                  Style.semiBold35ptb.copyWith(fontSize: 25.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
                        child: const TopLawyers(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
