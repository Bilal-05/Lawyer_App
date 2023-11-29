// import 'dart:io';

// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/homeVM/home_vm.dart';
import 'package:lawyer_app/views/home_view/widgets/categories.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => HomeVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 0.02.sh,
                    left: 0.05.sw,
                    right: 0.05.sw,
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
                      SizedBox(
                        child: FutureBuilder<DocumentSnapshot>(
                            future: vModel.users.doc(vModel.documentID).get(),
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
                                  data = snapshot.data!.data()
                                      as Map<String, dynamic>;
                                  vModel.userData = snapshot.data!.data()
                                      as Map<String, dynamic>;
                                }

                                return data['userType'] == 'client'
                                    ? Text(
                                        'Hello ${data['fname']}',
                                        style: Style.semiBold20ptb,
                                      )
                                    : data['userType'] == 'lawyer'
                                        ? Text(
                                            'Hello Mr. ${data['fullName']}',
                                            style: Style.semiBold20ptb,
                                          )
                                        : Text(
                                            'Hello Sir,',
                                            style: Style.semiBold20ptb,
                                          );
                              }

                              return CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              );
                            }),
                        // child: Text('Hello'),
                      ),
                      SizedBox(
                        width: 0.75.sw,
                        child: Text(
                          'Lets find the best lawyer to help you',
                          style: Style.semiBold20ptb,
                        ),
                      ),
                      20.verticalSpace,
                      SizedBox(
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
                      const Categories(),
                      // 20.verticalSpace,
                      // SizedBox(
                      //   child: Image(
                      //     image: NetworkImage(vModel.cnicFront),
                      //   ),
                      // ),
                      Text(vModel.front),
                      Text(vModel.back),
                      20.verticalSpace,
                      ElevatedButton(
                        onPressed: () {
                          vModel.showImage();
                        },
                        child: Text(
                          'Show Image',
                          style: Style.semiBold20ptw,
                        ),
                      ),
                      // 20.verticalSpace,
                      // SizedBox(
                      //   child: Image(
                      //     image: FileImage(File(vModel.cnicBack)),
                      //   ),
                      // ),

                      if (vModel.front != '') 20.verticalSpace,
                      if (vModel.front != '')
                        SizedBox(
                          child: Image(
                            image: NetworkImage(vModel.front),
                          ),
                        ),

                      if (vModel.back != '') 20.verticalSpace,
                      if (vModel.back != '')
                        SizedBox(
                          child: Image(
                            image: NetworkImage(vModel.back),
                          ),
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
