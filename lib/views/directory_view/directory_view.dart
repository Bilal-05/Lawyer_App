import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:lawyer_app/viewmodels/directoryVM/directory_vm.dart';
import 'package:lawyer_app/views/directory_view/widgets/selected_value.dart';
import 'package:stacked/stacked.dart';

class DirectoryView extends StatelessWidget {
  const DirectoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DirectoryVM(),
      onViewModelReady: (viewModel) => viewModel.initialize(),
      builder: (context, vModel, child) {
        return Scaffold(
          body: InkWell(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
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
                        'Directory',
                        Container(),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(
                        //     Icons.more_vert_rounded,
                        //     color: AppColors.primaryColor,
                        //   ),
                        // ),
                        Container(),
                      ),
                      20.verticalSpace,
                      if (vModel.alllawyer!.isEmpty)
                        SizedBox(
                          height: 0.5.sh,
                          width: 1.sw,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      if (vModel.alllawyer!.isNotEmpty)
                        TextField(
                          onChanged: (value) => vModel.search(value),
                          decoration: InputDecoration(
                            hintStyle: Style.regular14ptb.copyWith(
                                color: AppColors.primaryColor, fontSize: 10.sp),
                            hintText:
                                'Search Lawyer, Practice Area, Designation',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                              onPressed: () {
                                vModel.openSheet();
                              },
                              icon: Icon(
                                Icons.filter_alt_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      if (vModel.showFilter) 10.verticalSpace,
                      if (vModel.showFilter)
                        Container(
                          width: 1.sw,
                          // height: 0.4.sh,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColor, width: 2),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 0.02.sw, top: 5, bottom: 5),
                                      child: Text(
                                        'Sort By',
                                        style: Style.medium20ptb
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  // width: 0.75.sw,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style: vModel.filterButton,
                                          onPressed: () {
                                            vModel.filterRating();
                                          },
                                          child: Text(
                                            'Rating',
                                            style: Style.regular14ptb
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        10.horizontalSpace,
                                        ElevatedButton(
                                          style: vModel.filterButton,
                                          onPressed: () {
                                            vModel.filterExperience();
                                          },
                                          child: Text(
                                            'Experience',
                                            style: Style.regular14ptb
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        10.horizontalSpace,
                                        ElevatedButton(
                                          style: vModel.filterButton,
                                          onPressed: () {
                                            vModel.filterFees();
                                          },
                                          child: Text(
                                            'Fees',
                                            style: Style.regular14ptb
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        10.horizontalSpace,
                                        ElevatedButton(
                                          style: vModel.filterButton,
                                          onPressed: () {
                                            vModel.filterFreeConsultation();
                                          },
                                          child: Text(
                                            'Free Consultation',
                                            style: Style.regular14ptb
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                5.verticalSpace,
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 0.02.sw, top: 5, bottom: 5),
                                      child: Text(
                                        'Filter By Area of Practice',
                                        style: Style.medium20ptb
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                5.verticalSpace,
                                DirectSelect(
                                  itemExtent: 35.0,
                                  selectedIndex: vModel.selectedIndex,
                                  onSelectedItemChanged: (index) {
                                    vModel.setIndex(index);
                                  },
                                  items: vModel.buildTimingItem(),
                                  child: MySelectionItem(
                                    isForList: false,
                                    title: vModel.userService
                                        .practiceArea[vModel.selectedIndex],
                                  ),
                                ),

                                5.verticalSpace,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 0.01.sw),
                                      child: ElevatedButton(
                                        style: vModel.filterButton,
                                        onPressed: () {
                                          vModel.clearFilter();
                                        },
                                        child: Text(
                                          'Clear Filter',
                                          style: Style.regular14ptb
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Container(
                                      margin: EdgeInsets.only(right: 0.01.sw),
                                      child: ElevatedButton(
                                        style: vModel.filterButton,
                                        onPressed: () {
                                          vModel.filterByArea();
                                        },
                                        child: Text(
                                          'Search',
                                          style: Style.regular14ptb
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceEvenly,
                                //     children: [

                                //     ],
                                //   ),
                              ],
                            ),
                          ),
                        ),
                      if (vModel.alllawyer!.isNotEmpty) 10.verticalSpace,
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: vModel.foundItems!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 0.02.sw),
                              // margin: const EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {
                                  vModel.navigateToProfile(
                                      vModel.foundItems![index]['uid']);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 0.01.sh,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: AppColors.greyShade,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 0.05.sw,
                                          // right: 0.02.sw,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 0.02.sh,
                                                // left: 0.05.sw,
                                                // right: 0.02.sw,
                                              ),
                                              child: CircleAvatar(
                                                radius: 30.r,
                                                backgroundImage: NetworkImage(
                                                  vModel.foundItems![index][
                                                      'profilePhotoNetworkUrl'],
                                                ),
                                              ),
                                            ),
                                            10.verticalSpace,
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 0.01.sh),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 15.w,
                                                    child: Image.asset(
                                                      vModel.star,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  5.horizontalSpace,
                                                  SizedBox(
                                                    // margin: EdgeInsets.only(bottom: 0.01.sh),
                                                    child: Text(
                                                      vModel.foundItems![index]
                                                          ['rating'],
                                                      style: Style.regular14ptb,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // 15.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 0.62.sw,
                                            child: Text(
                                              vModel.foundItems![index]
                                                  ['fullName'],
                                              overflow: TextOverflow.clip,
                                              style: Style.semiBold20ptb,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.5.sw,
                                            child: Text(
                                              vModel.foundItems![index]
                                                  ['designation'],
                                              overflow: TextOverflow.ellipsis,
                                              style: Style.medium20ptb
                                                  .copyWith(fontSize: 16.sp),
                                            ),
                                          ),
                                          5.verticalSpace,
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              vModel.navigateToProfile(vModel
                                                  .foundItems![index]['uid']);
                                            },
                                            child: Text(
                                              'Appointment',
                                              style: Style.medium14ptb.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          5.verticalSpace,
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
          ),
        );
      },
    );
  }
}
