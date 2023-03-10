import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/features/location/presentaion/logic/bloc/location_bloc.dart';
import 'package:rick_and_morty_app/internal/helpers/text_helpers.dart';

import '../../../../../internal/helpers/color_helper.dart';

class InfoLocationScreen extends StatefulWidget {
  final LocationModel listLocation;
  const InfoLocationScreen({
    super.key,
    required this.listLocation,
  });

  @override
  State<InfoLocationScreen> createState() => _InfoLocationScreenState();
}

class _InfoLocationScreenState extends State<InfoLocationScreen> {
  late LocationBloc bloc;
  @override
  void initState() {
    bloc = LocationBloc();
    bloc.add(GetLocationCharecters(widget.listLocation));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: (() => Navigator.pop(context)),
                icon: Icon(Icons.arrow_back_ios_new))),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                "assets/images/planeta.png",
                height: 298.h,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 251.h),
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 34.h,
                ),
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.listLocation.name!,
                      style: TextHelper.w700s24,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.listLocation.type!,
                          style: TextHelper.w400s12
                              .copyWith(color: ColorHelper.grey828282),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: 4.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorHelper.grey828282,
                          ),
                        ),
                        Text(
                          widget.listLocation.dimension!,
                          style: TextHelper.w400s12
                              .copyWith(color: ColorHelper.grey828282),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 32,
                        bottom: 36,
                      ),
                      child: Text(
                        "?????? ??????????????, ???? ?????????????? ?????????????????? ???????????????????????? ????????, ?? ?????????????? ?????????? ?????? ???????????????????? ???????? ?? ??????????. ?????????????? ???????? ?????????? ?????????? 4,6 ???????????????????? ??????, ?? ?????? ???????????????? ?????????????????? ???????????????? ???? ?????????? ????????????.",
                        style: TextHelper.w400s13,
                      ),
                    ),
                    Text(
                      "??????????????????",
                      style: TextHelper.w500s20,
                    ),
                    BlocBuilder<LocationBloc, LocationState>(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is LocationCharectersFetchedState) {
                          return ListView.separated(
                            padding: EdgeInsets.only(top: 24.h),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) {
                              return Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      state.listOfCharectesModels[index].image!,
                                      width: 74.r,
                                    ),
                                  ),
                                  SizedBox(width: 18.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state
                                          .listOfCharectesModels[index].status
                                          .toString()),
                                      Text(state
                                          .listOfCharectesModels[index].name!),
                                      Text(
                                          "${state.listOfCharectesModels[index].gender}, ${state.listOfCharectesModels[index].species}"),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: (() {}),
                                    icon: Icon(
                                      Icons.navigate_next_rounded,
                                      size: 24.r,
                                    ),
                                  )
                                ],
                              );
                            }),
                            itemCount: state.listOfCharectesModels.length,
                            separatorBuilder: ((context, index) =>
                                SizedBox(height: 24.h)),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
