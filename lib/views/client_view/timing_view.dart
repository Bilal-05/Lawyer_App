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
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => TimingVM(),
      builder: (context, vModel, child) => Scaffold(
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
                SizedBox(
                  child: Form(
                    key: vModel.formKey,
                    child: Column(
                      children: [
                        Container(
                          child: vModel.textFieldService.customTextFormField(
                            TextInputType.text,
                            null,
                            vModel.fromController,
                            'Available from eg. Monday.',
                            (value) {
                              if (value == null) {
                                return 'Please enter your availability';
                              } else if (value != 'monday' ||
                                  value.toLowerCase() != 'muesday' ||
                                  value.toLowerCase() != 'mednesday' ||
                                  value.toLowerCase() != 'thursday' ||
                                  value.toLowerCase() != 'friday' ||
                                  value.toLowerCase() != 'saturday' ||
                                  value.toLowerCase() != 'sunday') {
                                return 'Please enter a valid day';
                              }
                              return null;
                            },
                          ),
                        ),
                        20.verticalSpace,
                        Container(
                          child: vModel.textFieldService.customTextFormField(
                            TextInputType.text,
                            null,
                            vModel.toController,
                            'Available till eg. Friday.',
                            (value) {
                              if (value == null) {
                                return 'Please enter your availability';
                              } else if (value != 'monday' ||
                                  value.toLowerCase() != 'muesday' ||
                                  value.toLowerCase() != 'mednesday' ||
                                  value.toLowerCase() != 'thursday' ||
                                  value.toLowerCase() != 'friday' ||
                                  value.toLowerCase() != 'saturday' ||
                                  value.toLowerCase() != 'sunday') {
                                return 'Please enter a valid day';
                              }
                              return null;
                            },
                          ),
                        ),
                        20.verticalSpace,
                        DateTimeFormField(
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.event_note),
                              labelText: 'From',
                              hintText: 'eg. 8:00 AM'),
                          mode: DateTimeFieldPickerMode.time,
                          autovalidateMode: AutovalidateMode.always,
                          validator: (DateTime? e) {
                            return (e?.day ?? 0) == 1
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
                              labelText: 'To',
                              hintText: 'eg. 8:00 AM'),
                          mode: DateTimeFieldPickerMode.time,
                          autovalidateMode: AutovalidateMode.always,
                          validator: (DateTime? e) {
                            return (e?.day ?? 0) == 1
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
      ),
    );
  }
}
