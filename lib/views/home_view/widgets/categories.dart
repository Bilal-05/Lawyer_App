import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/homeVM/home_vm.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeVM(),
      builder: (context, vModel, child) {
        return StreamBuilder<QuerySnapshot>(
          stream: vModel.category.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong", style: Style.medium20ptb);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                margin: EdgeInsets.only(top: 0.02.sh),
                height: 0.1.sh,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Skeletonizer(
                      enabled: true,
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Hero(
                          tag: '$index',
                          child: InkWell(
                            onTap: () async {
                              vModel.setFalse();
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 0.2.sw,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.greyShade,
                                        ),
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    margin: EdgeInsets.only(right: 5.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primaryColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 100.w,
                                        height: 10.h,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return Container(
              margin: EdgeInsets.only(
                top: 0.02.sh,
              ),
              height: 0.1.sh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  DocumentSnapshot category = snapshot.data!.docs[index];
                  vModel.userService.practiceAreas = snapshot.data!.docs;
                  return Hero(
                    tag: '${category['area']}',
                    child: InkWell(
                      onTap: () async {
                        vModel.setFalse();
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 0.2.sw,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: AppColors.greyShade,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      'https://media.istockphoto.com/id/1349700398/photo/paper-cut-family-judge-gavel-and-book-family-law.jpg?s=612x612&w=0&k=20&c=l2Lg7g0GR_XYxxQop3XXoHj33uc1oOMe2N9VEa8ZiQA=',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Container(
                              margin: EdgeInsets.only(right: 5.w),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  category['area'],
                                  style: Style.regular16ptb,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
