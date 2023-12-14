import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/viewmodels/lawVM/law_vm.dart';
import 'package:lawyer_app/views/law_view/widgets/another_law_card.dart';
import 'package:stacked/stacked.dart';

class LawView extends StatelessWidget {
  const LawView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.readJson(),
      viewModelBuilder: () => LawVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              child: Container(
                margin: EdgeInsets.only(
                  top: 0.02.sh,
                  left: 0.02.sw,
                  right: 0.02.sw,
                ),
                child: Column(
                  children: [
                    vModel.appbarService.customAppBar(
                      'Law',
                      Container(),
                      Container(),
                    ),
                    20.verticalSpace,
                    if (vModel.items.isEmpty)
                      SizedBox(
                        height: 0.5.sh,
                        width: 1.sw,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    if (vModel.items.isNotEmpty)
                      TextField(
                        onChanged: (value) => vModel.search(value),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    if (vModel.items.isNotEmpty) 10.verticalSpace,
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: vModel.foundItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: LawCard(
                              title: vModel.foundItems[index]["title"],
                              description: vModel.foundItems[index]
                                  ["description"],
                              id: vModel.foundItems[index]["id"].toString(),
                            ),
                          );
                        },
                      ),
                    ),
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
