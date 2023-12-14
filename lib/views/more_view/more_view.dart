import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100.r,
                      backgroundImage: NetworkImage(vModel
                          .userService.userData['profilePhotoNetworkUrl']),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          vModel.eraseData();
                          // log(vModel.userService.userData.toString());
                        },
                        child: Text(
                          'Sign Out',
                          style: Style.regular16ptb,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
