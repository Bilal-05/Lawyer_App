import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/requestVM/request_vm.dart';
import 'package:lawyer_app/widgets/customtextfield.dart';
import 'package:stacked/stacked.dart';

class RequestTile extends StatelessWidget {
  final Map userData;
  final int index;
  const RequestTile({super.key, required this.userData, required this.index});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => RequestVM(),
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
                        'Request No: ',
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
                  Row(
                    children: [
                      Text(
                        'Name: ',
                        style: Style.semiBold20ptb.copyWith(
                            color: AppColors.greyShade, fontSize: 18.sp),
                      ),
                      5.horizontalSpace,
                      SizedBox(
                        width: 0.60.sw,
                        child: Text(
                          userData['clientName'],
                          overflow: TextOverflow.ellipsis,
                          style: Style.medium14ptb.copyWith(fontSize: 16.sp),
                        ),
                      ),
                    ],
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
                    'Issue Drescribed: ',
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
                  Text(
                    'Response: ',
                    style: Style.semiBold20ptb
                        .copyWith(color: AppColors.greyShade, fontSize: 18.sp),
                  ),
                  5.verticalSpace,
                  vModel.dropDownResponse(),
                  5.verticalSpace,
                  if (vModel.selectedResponse == 'Reject')
                    Text(
                      'Reason: ',
                      style: Style.semiBold20ptb.copyWith(
                          color: AppColors.greyShade, fontSize: 18.sp),
                    ),
                  if (vModel.selectedResponse == 'Reject') 5.verticalSpace,
                  if (vModel.selectedResponse == 'Reject')
                    SizedBox(
                      child: Form(
                        key: vModel.formKey,
                        child: CustomTextField(
                          hintText: 'Reason',
                          controller: vModel.reasonController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter reason';
                            } else if (value.length > 25) {
                              return 'Reason must be 25 characters long';
                            }
                            return null;
                          },
                        ),
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
                          onPressed: () async {
                            await vModel.splitDateandTime(userData);
                            await vModel.response(
                                userData['uid'].toString(), userData);
                            // log(vModel.totalMeeting.toString());
                            // vModel.addMeetingLawyer(userData);
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
