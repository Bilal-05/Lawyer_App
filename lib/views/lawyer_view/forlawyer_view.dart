import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/viewmodels/lawyerVM/forlawyer_vm.dart';
import 'package:stacked/stacked.dart';

class LawyerView extends StatelessWidget {
  const LawyerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => LawyerVM(),
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
                  Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
