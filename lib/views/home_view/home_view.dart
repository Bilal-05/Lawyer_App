import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/homeVM/home_vm.dart';
import 'package:lawyer_app/views/home_view/widgets/categories.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HomeVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 0.02.sh,
                    left: 0.05.sw,
                    right: 0.05.sw,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: vModel.appbarService.customAppBar(
                          'Home',
                          Container(),
                          Container(),
                        ),
                      ),
                      20.verticalSpace,
                      SizedBox(
                        child: Text(
                          'Hi user,',
                          style: Style.regular16ptb.copyWith(fontSize: 18.sp),
                        ), //after firebase user name will be display
                      ),
                      SizedBox(
                        width: 0.75.sw,
                        child: Text(
                          'Lets find the best lawyer to help you',
                          style: Style.semiBold20ptb,
                        ),
                      ),
                      20.verticalSpace,
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              'Categories',
                              style:
                                  Style.semiBold35ptb.copyWith(fontSize: 25.sp),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Text('See all', style: Style.regular16ptb),
                            ),
                          ],
                        ),
                      ),
                      const Categories(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
