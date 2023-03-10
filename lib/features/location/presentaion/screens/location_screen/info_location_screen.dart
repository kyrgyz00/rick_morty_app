import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/internal/helpers/text_helpers.dart';

import '../../../../../internal/helpers/color_helper.dart';

class InfoLocationScreen extends StatelessWidget {
  final LocationModel listLocation;
  const InfoLocationScreen({
    super.key,
    required this.listLocation,
  });

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
                width: 375.w,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listLocation.name!,
                      style: TextHelper.w700s24,
                    ),
                    Row(
                      children: [
                        Text(
                          listLocation.type!,
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
                          listLocation.dimension!,
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
                        "Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.",
                        style: TextHelper.w400s13,
                      ),
                    ),
                    Text(
                      "Персонажи",
                      style: TextHelper.w500s20,
                    ),
                    ListView.separated(
                      padding: EdgeInsets.only(top: 24.h),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                listLocation.residentsModel![index].image!,
                                width: 74.r,
                              ),
                            ),
                            SizedBox(width: 18.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(listLocation.residentsModel![index].status.toString()),
                                Text(listLocation.residentsModel![index].name!),
                                Text("${listLocation.residentsModel![index].gender}, ${listLocation.residentsModel![index].species}"),
                              ],
                            ),
                            Spacer(),
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
                      itemCount: listLocation.residentsModel!.length,
                      separatorBuilder: ((context, index) =>
                          SizedBox(height: 24.h)),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
