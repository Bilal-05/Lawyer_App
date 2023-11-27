import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/viewmodels/mainmenuVM/mainmenu_vm.dart';
import 'package:stacked/stacked.dart';

class MainMenuView extends StatelessWidget {
  const MainMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MainMenuVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          body: vModel.page[vModel.myIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              vModel.onChanged(index);
            },
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.greyShade,
            iconSize: 25.sp,
            showSelectedLabels: false,
            showUnselectedLabels: true,
            currentIndex: vModel.myIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.plagiarism),
                label: 'Law',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'More',
              ),
            ],
          ),
        );
      },
    );
  }
}
