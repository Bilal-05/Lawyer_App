import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/viewmodels/appointmentVM/appointment_vm.dart';
import 'package:lawyer_app/views/directory_view/widgets/selected_value.dart';
import 'package:stacked/stacked.dart';

class Direct extends StatelessWidget {
  final List timing;
  const Direct({super.key, required this.timing});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initialize(timing),
      viewModelBuilder: () => AppointmentVM(),
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
            title: vModel.hour[vModel.selectedIndex],
          ),
        );
      },
    );
  }
}
