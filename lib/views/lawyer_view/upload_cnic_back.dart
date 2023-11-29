// import 'dart:developer';
// import 'dart:io';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
// import 'package:lawyer_app/theme/colors.dart';
// import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/lawyerVM/upload_vm.dart';
import 'package:stacked/stacked.dart';

class UploadCnicBackView extends StatelessWidget {
  const UploadCnicBackView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UploadCnicVM(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: 1.sw,
              height: 1.sh,
              margin: EdgeInsets.only(
                top: 0.075.sh,
                left: 0.05.sw,
                right: 0.05.sw,
              ),
              child: Column(
                children: [
                  Text(
                    'CNIC',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Upload back side of your cnic.',
                      style: Style.medium14ptb,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  0.03.sh.verticalSpace,
                  viewModel.scannnedBack == null
                      ? Text(
                          'No image selected.',
                          style: Style.regular16ptb,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // width: 0.65.sw,
                          margin: EdgeInsets.only(top: 0.1.sh),
                          child: Image.file(viewModel.scannnedBack!,
                              fit: BoxFit.cover),
                        ),
                  const Spacer(),
                  viewModel.scannnedBack == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(bottom: 0.02.sh),
                          child: ElevatedButton(
                            style: viewModel.b3style,
                            onPressed: () {
                              // viewModel.startScanscannnedBack(context);
                              viewModel.onPressedback();
                            },
                            child: Text(
                              "The picture isn't clear.",
                              style: Style.semiBold20ptw,
                            ),
                          ),
                        ),
                  viewModel.scannnedBack == null
                      ? Container(
                          margin: EdgeInsets.only(bottom: 0.03.sh),
                          child: ElevatedButton(
                            style: viewModel.b3style,
                            onPressed: () {
                              viewModel.onPressedback();
                            },
                            child: Text(
                              'Scan Front',
                              style: Style.semiBold20ptw,
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: 0.03.sh),
                          child: ElevatedButton(
                            style: viewModel.b3style,
                            onPressed: () {
                              viewModel.navigateToMenuMain();
                            },
                            child: Text(
                              "The picture is clear.",
                              style: Style.semiBold20ptw,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
