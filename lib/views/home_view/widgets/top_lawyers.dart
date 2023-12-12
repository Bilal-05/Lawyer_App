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
              height: 0.4.sh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  DocumentSnapshot user = snapshot.data!.docs[index];

                  return InkWell(
                    onTap: () {
                      // vModel.showCnic();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 0.05.sw),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: AppColors.greyShade,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Container(
                          //   margin: EdgeInsets.only(
                          //     top: 0.02.sh,
                          //     left: 0.02.sw,
                          //     right: 0.02.sw,
                          //   ),
                          //   child: CircleAvatar(
                          //     radius: 0.1.sh,
                          //     backgroundImage: NetworkImage(
                          //       user['image'],
                          //     ),
                          //   ),
                          // ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 0.02.sh,
                              left: 0.02.sw,
                              right: 0.02.sw,
                            ),
                            child: Text(
                              user['fullName'],
                              style: Style.semiBold14ptb,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 0.02.sh,
                              left: 0.02.sw,
                              right: 0.02.sw,
                            ),
                            child: Text(
                              "Rating: ${user['rating']}",
                              style: Style.regular14ptb,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 0.02.sh,
                              left: 0.02.sw,
                              right: 0.02.sw,
                            ),
                            child: Text(
                              user['experience'],
                              style: Style.regular14ptb,
                            ),
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
