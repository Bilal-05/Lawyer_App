import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/appointmentVM/appointment_vm.dart';
import 'package:stacked/stacked.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => AppointmentVM(),
        builder: (context, vModel, child) {
          return Column(
            children: [
              SizedBox(
                width: 1.sw,
                child: Row(
                  children: [
                    Text(
                      'Select Date',
                      style: Style.medium20ptb,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        vModel.onTap(context);
                      },
                      child: Row(
                        children: [
                          Text(
                            vModel.selectedMonth!,
                            style: Style.regular14ptb,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              10.verticalSpace,
              SizedBox(
                height: 0.2.sh,
                child: DatePicker(
                  vModel.initialDate,
                  daysCount: 31,
                  initialSelectedDate: vModel.initialDate,
                  selectionColor: AppColors.primaryColor,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    vModel.setDate(date);
                  },
                ),
              ),
            ],
          );
        });
  }
}
