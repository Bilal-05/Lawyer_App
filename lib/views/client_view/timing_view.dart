// import 'dart:developer';

// import 'dart:developer';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/clientVM/timing_vm.dart';
import 'package:stacked/stacked.dart';

class TimingView extends StatelessWidget {
  const TimingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TimingVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              height: 1.sh,
              width: 1.sw,
              margin:
                  EdgeInsets.only(top: 0.075.sh, left: 0.05.sw, right: 0.05.sw),
              child: Column(
                children: [
                  Text(
                    'Timing',
                    textAlign: TextAlign.center,
                    style: Style.bol30ptb,
                  ),
                  0.02.sh.verticalSpace,
                  SizedBox(
                    width: 0.75.sw,
                    child: Text(
                      'Tell us about your availability.',
                      style: Style.medium14ptb,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  0.03.sh.verticalSpace,
                  Container(
                    child: vModel.dropDownStartDay(),
                  ),
                  20.verticalSpace,
                  Container(
                    child: vModel.dropDownEndDay(),
                  ),
                  20.verticalSpace,
                  SizedBox(
                    child: Form(
                      key: vModel.formKey,
                      child: Column(
                        children: [
                          DateTimeFormField(
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black45),
                                errorStyle: TextStyle(color: Colors.redAccent),
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.event_note),
                                labelText: 'Office Time Start',
                                hintText: 'eg. 8:00 AM'),
                            mode: DateTimeFieldPickerMode.time,
                            autovalidateMode: AutovalidateMode.always,
                            validator: (DateTime? e) {
                              return (e?.hour ?? 0) == 0
                                  ? 'Please not the first day'
                                  : null;
                            },
                            onDateSelected: (DateTime value) {
                              vModel.timeFromController.text =
                                  DateFormat.jm().format(value);
                            },
                          ),
                          20.verticalSpace,
                          DateTimeFormField(
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black45),
                                errorStyle: TextStyle(color: Colors.redAccent),
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.event_note),
                                labelText: 'Office Time End',
                                hintText: 'eg. 8:00 AM'),
                            mode: DateTimeFieldPickerMode.time,
                            autovalidateMode: AutovalidateMode.always,
                            validator: (DateTime? e) {
                              return (e?.hour ?? 0) == 1
                                  ? 'Please not the first day'
                                  : null;
                            },
                            onDateSelected: (DateTime value) {
                              vModel.timeToController.text =
                                  DateFormat.jm().format(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: 0.03.sh),
                    child: ElevatedButton(
                      style: vModel.b1style,
                      onPressed: () {
                        vModel.navigateToContact();
                      },
                      child: Text(
                        'Next',
                        style: Style.semiBold20ptw,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
