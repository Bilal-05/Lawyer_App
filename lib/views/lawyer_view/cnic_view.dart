import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/lawyerVM/cnic_vm.dart';
import 'package:lawyer_app/widgets/customTextField.dart';
import 'package:stacked/stacked.dart';

class CnicView extends StatelessWidget {
  const CnicView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => CnicVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                    'Enter Cnic',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Provide us your CNIC details.',
                      style: Style.medium14ptb,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  0.03.sh.verticalSpace,
                  SizedBox(
                    child: Form(
                      key: vModel.formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            child: CustomTextField(
                              keyboardType: TextInputType.text,
                              suffix: null,
                              controller: vModel.nameController,
                              hintText: 'Full name',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                          20.verticalSpace,
                          SizedBox(
                            child: CustomTextField(
                              keyboardType: TextInputType.number,
                              suffix: null,
                              controller: vModel.cnicController,
                              hintText: '4XXXX-XXXXXXX-X',
                              validator: (value) {
                                bool isCnic =
                                    RegExp('^[0-9]{5}-[0-9]{7}-[0-9]\$')
                                        .hasMatch(value!);
                                if (value.isEmpty || !isCnic) {
                                  return 'Enter CNIC in 4XXXX-XXXXXXX-X format';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 0.03.sh),
                    child: ElevatedButton(
                      style: vModel.b3style,
                      onPressed: () {
                        vModel.navigateToScanView();
                      },
                      child: Text(
                        'Next',
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
