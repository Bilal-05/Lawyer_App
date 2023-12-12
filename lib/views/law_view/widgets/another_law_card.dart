import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/lawVM/law_vm.dart';
import 'package:stacked/stacked.dart';

class LawCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  const LawCard(
      {super.key,
      required this.id,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LawVM(),
      builder: ((context, viewModel, child) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Law No: $id', style: Style.semiBold20ptb),
                    const Spacer(),
                    (!viewModel.showDesc)
                        ? IconButton(
                            onPressed: () {
                              viewModel.makeTrue();
                              // setState(
                              //   () {
                              //     ShowDesc = true;
                              //   },
                              // );
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              viewModel.makeFalse();
                              // setState(
                              //   () {
                              //     ShowDesc = false;
                              //   },
                              // );
                            },
                            icon: const Icon(
                              Icons.arrow_drop_up,
                              size: 30,
                            ),
                          )
                  ],
                ),
                SizedBox(
                  child: Text(
                    title,
                    style: Style.semiBold14ptb.copyWith(fontSize: 16.sp),
                  ),
                ),
                10.verticalSpace,
                (viewModel.showDesc)
                    ? SizedBox(
                        child: Text(description, style: Style.regular14ptb),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
