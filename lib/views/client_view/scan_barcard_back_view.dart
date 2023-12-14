// import 'dart:developer';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/clientVM/upload_barcard_vm.dart';
import 'package:stacked/stacked.dart';

class BarBackView extends StatelessWidget {
  const BarBackView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BarCardVM(),
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
                    'Bar License',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Upload back side of your bar license.',
                      style: Style.medium14ptb,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  0.03.sh.verticalSpace,
                  viewModel.barBack == null
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
                          child:
                              Image.file(viewModel.barBack!, fit: BoxFit.cover),
                        ),
                  const Spacer(),
                  viewModel.barBack == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(bottom: 0.02.sh),
                          child: ElevatedButton(
                            style: viewModel.b3style,
                            onPressed: () {
                              // viewModel.startScanBack(context);
                              viewModel.onPressedBarBack();
                            },
                            child: Text(
                              "The picture isn't clear.",
                              style: Style.semiBold20ptw,
                            ),
                          ),
                        ),
                  viewModel.barBack == null
                      ? Container(
                          margin: EdgeInsets.only(bottom: 0.03.sh),
                          child: ElevatedButton(
                            style: viewModel.b3style,
                            onPressed: () {
                              viewModel.onPressedBarBack();
                            },
                            child: Text(
                              'Scan Back',
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
                            child: viewModel.isBusy
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
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
