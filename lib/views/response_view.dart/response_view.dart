import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/responseVM/response_vm.dart';
import 'package:lawyer_app/views/response_view.dart/widgets/response_tile.dart';
import 'package:stacked/stacked.dart';

class ResponseView extends StatelessWidget {
  const ResponseView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ResponseVM(),
        builder: ((context, vModel, child) {
          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('sendResponse')
                .doc(vModel.user!.uid)
                .collection('responses')
                .snapshots(),
            // stream: vModel.lawyers.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Something went wrong',
                      style: Style.semiBold20ptb,
                    ),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                );
              }

              return Scaffold(
                  body: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 0.02.sh, left: 0.02.sw, right: 0.02.sw),
                  child: Column(
                    children: [
                      vModel.appbarService.customAppBar(
                        'Responses',
                        IconButton(
                          onPressed: () {
                            vModel.goBack();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Container(),
                      ),
                      if (snapshot.data!.docs.isEmpty)
                        Text(
                          'No Response',
                          style: Style.semiBold20ptb,
                        ),
                      if (snapshot.data!.docs.isNotEmpty)
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              // ignore: unused_local_variable
                              DocumentSnapshot data =
                                  snapshot.data!.docs[index];
                              return ResponseTile(
                                userData: data['response'],
                                index: index + 1,
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ));
            },
          );
        }));
  }
}
