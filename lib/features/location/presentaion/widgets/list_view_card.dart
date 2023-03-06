import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';
import '../../data/models/location_model.dart';
import '../screens/location_screen/info_location_screen.dart';

class LocationListViewCard extends StatelessWidget {
  final List<LocationModel> listLocation;
  const LocationListViewCard({
    Key? key,
    required this.listLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: ((context, index) => Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => InfoLocationScreen(listLocation: listLocation, index: index,)))),
                      child: Column(
                        children: [
                          Container(
                            // margin: EdgeInsets.only(top: 24.h),
                            width: 343.w,
                            height: 150.h,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/images/planeta.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 16.w,
                              bottom: 12.h,
                            ),
                            width: 343.w,
                            height: 68.h,
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(30))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listLocation[index].name!,
                                  style: TextHelper.w500s20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      listLocation[index].type!,
                                      style: TextHelper.w400s12.copyWith(
                                          color: ColorHelper.grey828282),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      width: 4.w,
                                      height: 4.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorHelper.grey828282,
                                      ),
                                    ),
                                    Text(
                                      listLocation[index].dimension!,
                                      style: TextHelper.w400s12.copyWith(
                                          color: ColorHelper.grey828282),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            separatorBuilder: ((context, index) => SizedBox(
                  height: 24.h,
                )),
            itemCount: listLocation.length));
  }
}
