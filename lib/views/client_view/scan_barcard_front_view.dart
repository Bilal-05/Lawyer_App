import 'package:flutter/material.dart';
import 'package:lawyer_app/viewmodels/clientVM/scan_barcard_front_vm.dart';
import 'package:stacked/stacked.dart';

class BarFrontView extends StatelessWidget {
  const BarFrontView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BarFrontVM(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
