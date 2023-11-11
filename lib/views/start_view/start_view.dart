import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/startVM/start_vm.dart';
import 'package:stacked/stacked.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => StartVM(),
      builder: (ctx, vModel, child) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: 1.sh,
              height: 1.sh,
              margin: EdgeInsets.only(
                right: 20,
                left: 20,
                top: 0.02.sh,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        vModel.personLaptop,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 0.05.sh,
                      ),
                      width: 300,
                      child: Text(
                        'Find the best lawyer.',
                        style: Style.semiBold35ptb,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 0.05.sh,
                      ),
                      width: 350,
                      child: Text(
                        'Explore the best lawyers in K-Town and make your life easy',
                        style: Style.regular16ptb,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 0.04.sh,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
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
                            Container(
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
