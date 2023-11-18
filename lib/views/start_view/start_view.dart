import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/startVM/start_vm.dart';
// import 'package:lawyer_app/views/start_view/start_vm.dart';
import 'package:stacked/stacked.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => StartVM(),
      builder: (ctx, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              width: 1.sh,
              height: 1.sh,
              margin: EdgeInsets.only(
                right: 0.02.sw,
                left: 0.02.sw,
                top: 0.02.sh,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 0.75.sw,
                      child: Image.asset(
                        vModel.personLaptop,
                        fit: BoxFit.contain,
                      ),
                    ),
                    0.05.sh.verticalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            'Find the best lawyer.',
                            softWrap: true,
                            style: Style.semiBold35ptb,
                            textAlign: TextAlign.center,
                            strutStyle: const StrutStyle(height: -1.5),
                          ),
                        ),
                        30.verticalSpace,
                        SizedBox(
                          width: 350,
                          child: Text(
                            'Explore the best lawyers in K-Town and make your life easy',
                            style: Style.regular16ptb,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 0.03.sh),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              child: ElevatedButton(
                                style: vModel.b1style,
                                onPressed: () {
                                  vModel.navigateToLogin();
                                },
                                child: Text(
                                  'Login',
                                  style: Style.semiBold20ptw,
                                ),
                              ),
                            ),
                            10.horizontalSpace,
                            SizedBox(
                              child: ElevatedButton(
                                style: vModel.b2style,
                                onPressed: () {
                                  vModel.navigateToRegister();
                                },
                                child: Text(
                                  'Register',
                                  style: Style.semiBold20ptb,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
