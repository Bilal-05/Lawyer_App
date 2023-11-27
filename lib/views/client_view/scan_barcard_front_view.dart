import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/clientVM/upload_barcard_vm.dart';
import 'package:stacked/stacked.dart';

class BarFrontView extends StatelessWidget {
  const BarFrontView({super.key});

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
                    'Scan Bar License',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Scan front side of your bar license.',
                      style: Style.medium14ptb,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  0.03.sh.verticalSpace,
                  for (var picture in viewModel.frontSide)
                    viewModel.frontSide.length == 1
                        ? SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    log(picture);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 5,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    margin: EdgeInsets.only(top: 0.1.sh),
                                    width: 360,
                                    height: 250,
                                    child: Image.file(
                                      File(picture),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  const Spacer(),
                  viewModel.frontSide.isNotEmpty
                      ? Container(
                          margin: EdgeInsets.only(bottom: 0.03.sh),
                          child: ElevatedButton(
                            style: viewModel.b3style,
                            onPressed: viewModel.onPressedfirst,
                            child: Text(
                              "The picture isn't clear.",
                              style: Style.semiBold20ptw,
                            ),
                          ),
                        )
                      : Container(),
                  viewModel.frontSide.isEmpty
                      ? Container(
                          margin: EdgeInsets.only(bottom: 0.03.sh),
                          child: ElevatedButton(
                            style: viewModel.b3style,
                            onPressed: viewModel.onPressedfirst,
                            child: Text(
                              "Scan front side",
                              style: Style.semiBold20ptw,
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: 0.03.sh),
                          child: ElevatedButton(
                            style: viewModel.b3style,
                            onPressed: () {
                              viewModel.frontSide.isNotEmpty
                                  ? viewModel.navigateToBarCardBack()
                                  : null;
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
