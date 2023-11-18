import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/lawyerVM/upload_vm.dart';
import 'package:stacked/stacked.dart';

class UploadCnicView extends StatelessWidget {
  const UploadCnicView({super.key});

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Scan CNIC',
                      textAlign: TextAlign.center,
                      style: Style.bol30ptb,
                    ),
                    0.02.sh.verticalSpace,
                    SizedBox(
                      width: 0.75.sw,
                      child: Text(
                        'Upload your CNIC to add authecity.',
                        style: Style.medium14ptb,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    0.03.sh.verticalSpace,
                    for (var picture in viewModel.picturess)
                      SizedBox(
                        child: Column(
                          children: [
                            Image.file(
                              File(picture),
                              height: 300,
                              width: 300,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                viewModel.removePicture(picture);
                              },
                              child: const Text("Remove Picture"),
                            ),
                          ],
                        ),
                      ),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: viewModel.onPressed,
                        child: const Text("Add Pictures")),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
