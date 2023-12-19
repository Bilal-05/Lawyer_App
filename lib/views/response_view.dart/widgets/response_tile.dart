import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/responseVM/response_vm.dart';
import 'package:stacked/stacked.dart';

class ResponseTile extends StatelessWidget {
  final Map userData;
  final int index;
  const ResponseTile({super.key, required this.userData, required this.index});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ResponseVM(),
        builder: (context, vModel, child) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
            ),
            margin: EdgeInsets.only(
              bottom: 0.01.sh,
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: 0.02.sh,
                left: 0.02.sw,
                right: 0.02.sw,
                bottom: 0.02.sh,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Response No: ',
                        style: Style.semiBold20ptb.copyWith(
                            color: AppColors.greyShade, fontSize: 18.sp),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        child: Text(
                          index.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: Style.medium14ptb.copyWith(fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Text(
                    'Response From: ',
                    style: Style.semiBold20ptb
                        .copyWith(color: AppColors.greyShade, fontSize: 18.sp),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    width: 0.60.sw,
                    child: Text(
                      userData['lawyerName'],
                      overflow: TextOverflow.ellipsis,
                      style: Style.medium14ptb.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    'Issue You Described: ',
                    style: Style.semiBold20ptb
                        .copyWith(color: AppColors.greyShade, fontSize: 18.sp),
                  ),
                  5.verticalSpace,
                  SizedBox(
                    width: 0.90.sw,
                    child: Text(
                      userData['description'],
                      // overflow: TextOverflow.ellipsis,
                      style: Style.medium14ptb.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Date: ',
                        style: Style.semiBold20ptb.copyWith(
                            color: AppColors.greyShade, fontSize: 18.sp),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        width: 0.60.sw,
                        child: Text(
                          userData['date'],
                          // overflow: TextOverflow.ellipsis,
                          style: Style.medium14ptb.copyWith(fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Time: ',
                        style: Style.semiBold20ptb.copyWith(
                            color: AppColors.greyShade, fontSize: 18.sp),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        width: 0.60.sw,
                        child: Text(
                          userData['time'],
                          // overflow: TextOverflow.ellipsis,
                          style: Style.medium14ptb.copyWith(fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Text(
                    'Response: ',
                    style: Style.semiBold20ptb
                        .copyWith(color: AppColors.greyShade, fontSize: 18.sp),
                  ),
                  5.verticalSpace,
                  SizedBox(
                    width: 0.90.sw,
                    child: Text(
                      "Appointment request ${userData['response']}ed.",
                      // overflow: TextOverflow.ellipsis,
                      style: Style.medium14ptb.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    width: 1.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: vModel.b1style,
                          onPressed: () {
                            // vModel.response(userData['uid'].toString(), userData);
                          },
                          child: Text(
                            'OK',
                            style: Style.semiBold20ptw,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
