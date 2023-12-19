import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/viewmodels/profileVM/profile_vm.dart';
import 'package:lawyer_app/views/directory_view/widgets/selected_value.dart';
import 'package:stacked/stacked.dart';

class Direct extends StatelessWidget {
  const Direct({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileVM(),
      builder: (context, vModel, child) {
        return DirectSelect(
          itemExtent: 35.0,
          selectedIndex: vModel.selectedIndex,
          onSelectedItemChanged: (index) {
            vModel.setIndex(index);
          },
          items: vModel.buildTimingItem(),
          child: MySelectionItem(
            isForList: false,
            title: vModel.userService.slots![vModel.selectedIndex],
          ),
        );
      },
    );
  }
}
