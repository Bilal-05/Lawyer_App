import 'package:flutter/material.dart';
import 'package:lawyer_app/viewmodels/clientVM/client_vm.dart';
import 'package:stacked/stacked.dart';

class ClientView extends StatelessWidget {
  const ClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ClientVM(),
      builder: (context, vModel, child) {
        return const Scaffold(
          body: Center(
            child: Text('Client View'),
          ),
        );
      },
    );
  }
}
