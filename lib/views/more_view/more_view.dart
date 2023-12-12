import 'package:flutter/material.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/moreVM/more_vm.dart';
import 'package:stacked/stacked.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => MoreVM(),
        builder: (context, vModel, child) {
          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      vModel.eraseData();
                    },
                    child: Text(
                      'Sign Out',
                      style: Style.regular16ptb,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
