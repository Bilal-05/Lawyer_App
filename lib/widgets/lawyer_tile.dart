import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';

class LawyerTile extends StatelessWidget {
  final String rating;
  final String name;
  final String designation;
  final String star = 'assets/images/Star.png';
  final String profileURL;
  const LawyerTile(
      {super.key,
      required this.rating,
      required this.name,
      required this.designation,
      required this.profileURL});

  @override
  Widget build(BuildContext context) {
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
                    radius: 30.r,
                    backgroundImage: NetworkImage(
                      profileURL,
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
                        width: 15.w,
                        child: Image.asset(
                          star,
                          fit: BoxFit.cover,
                        ),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        // margin: EdgeInsets.only(bottom: 0.01.sh),
                        child: Text(
                          rating,
                          style: Style.regular14ptb,
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
                  width: 0.61.sw,
                  child: Text(
                    name,
                    style: Style.semiBold20ptb,
                  ),
                ),
                SizedBox(
                  child: Text(
                    designation,
                    style: Style.medium20ptb.copyWith(fontSize: 16.sp),
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
                  onPressed: () {},
                  child: Text(
                    'Appointment',
                    style: Style.regular14ptb.copyWith(
                      color: Colors.white,
                    ),
                  ),
                )
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
  }
}
