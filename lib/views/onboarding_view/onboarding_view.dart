// import 'dart:developer';

// import 'dart:developer';

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/onboardingVM/onboarding_vm.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => OnBoardingVM(),
      builder: (ctx, vModel, child) {
        return FutureBuilder<DocumentSnapshot>(
          future: vModel.users.doc(vModel.documentID).get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            // Map<String, dynamic> dummyData = {};

            if (snapshot.hasError) {
              return const Scaffold(
                body: Center(
                  child: Text("Something went wrong"),
                ),
              );
            }

            // if (snapshot.hasError) {
            //   return Scaffold(
            //     // backgroundColor: AppColors.primaryColor,
            //     body: SafeArea(
            //       child: Container(
            //         width: 1.sw,
            //         height: 1.sh,
            //         margin: EdgeInsets.only(
            //           right: 0.05.sw,
            //           left: 0.05.sw,
            //           top: 0.075.sh,
            //         ),
            //         child: Center(
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               SizedBox(
            //                 width: 0.75.sw,
            //                 child: Text(
            //                   'What are  you looking for?',
            //                   textAlign: TextAlign.center,
            //                   style: Style.bol30ptb,
            //                 ),
            //               ),
            //               Container(
            //                   width: 0.65.sw,
            //                   child: Lottie.asset(vModel.looking)),
            //               0.02.sh.verticalSpace,
            //               Container(
            //                 child: vModel.dropDown(),
            //               ),
            //               const Spacer(),
            //               Container(
            //                 margin: EdgeInsets.only(
            //                   bottom: 0.03.sh,
            //                 ),
            //                 child: ElevatedButton(
            //                   style: vModel.b1style,
            //                   onPressed: () {
            //                     vModel.navigateToOnBoardingView();
            //                   },
            //                   child: Text(
            //                     'Next',
            //                     style: Style.semiBold20ptw,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   );
            // }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = {};
              if (snapshot.data!.data() != null) {
                data = snapshot.data!.data() as Map<String, dynamic>;
                log(data['firstLogin'].toString());
              }

              return Scaffold(
                // backgroundColor: AppColors.primaryColor,
                // body: data['firstLogin'] == null
                //     ? SafeArea(
                //         child: Container(
                //           width: 1.sw,
                //           height: 1.sh,
                //           margin: EdgeInsets.only(
                //             right: 0.05.sw,
                //             left: 0.05.sw,
                //             top: 0.075.sh,
                //           ),
                //           child: Center(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 SizedBox(
                //                   width: 0.75.sw,
                //                   child: Text(
                //                     'What are  you looking for?',
                //                     textAlign: TextAlign.center,
                //                     style: Style.bol30ptb,
                //                   ),
                //                 ),
                //                 Container(
                //                   width: 0.65.sw,
                //                   child: Lottie.asset(vModel.looking),
                //                 ),
                //                 0.02.sh.verticalSpace,
                //                 Container(
                //                   child: vModel.dropDown(),
                //                 ),
                //                 const Spacer(),
                //                 Container(
                //                   margin: EdgeInsets.only(
                //                     bottom: 0.03.sh,
                //                   ),
                //                   child: ElevatedButton(
                //                     style: vModel.b1style,
                //                     onPressed: () {
                //                       vModel.navigateToOnBoardingView();
                //                     },
                //                     child: Text(
                //                       'Next',
                //                       style: Style.semiBold20ptw,
                //                     ),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       )
                body: data['firstLogin'] == false
                    ? SafeArea(
                        child: Container(
                          width: 1.sw,
                          height: 1.sh,
                          margin: EdgeInsets.only(
                            right: 0.05.sw,
                            left: 0.05.sw,
                            top: 0.075.sh,
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 0.75.sw,
                                  child: Text(
                                    'Skip to Home',
                                    textAlign: TextAlign.center,
                                    style: Style.bol30ptb,
                                  ),
                                ),
                                SizedBox(
                                  // width: 0.65.sw,
                                  child: Lottie.asset(vModel.skip),
                                ),
                                // const Spacer(),
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 0.03.sh,
                                  ),
                                  child: ElevatedButton(
                                    style: vModel.b1style,
                                    onPressed: () {
                                      vModel.navigateToMainMenu();
                                    },
                                    child: Text(
                                      'Skip',
                                      style: Style.semiBold20ptw,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : SafeArea(
                        child: Container(
                          width: 1.sw,
                          height: 1.sh,
                          margin: EdgeInsets.only(
                            right: 0.05.sw,
                            left: 0.05.sw,
                            top: 0.075.sh,
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 0.75.sw,
                                  child: Text(
                                    'What are  you looking for?',
                                    textAlign: TextAlign.center,
                                    style: Style.bol30ptb,
                                  ),
                                ),
                                SizedBox(
                                  width: 0.65.sw,
                                  child: Lottie.asset(vModel.looking),
                                ),
                                0.02.sh.verticalSpace,
                                SizedBox(
                                  child: vModel.dropDown(),
                                ),
                                const Spacer(),
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 0.03.sh,
                                  ),
                                  child: ElevatedButton(
                                    style: vModel.b1style,
                                    onPressed: () {
                                      vModel.navigateToOnBoardingView();
                                    },
                                    child: Text(
                                      'Next',
                                      style: Style.semiBold20ptw,
                                    ),
                                  ),
                                )
                              ],
                            ),
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
          },
        );
      },
    );
  }
}
