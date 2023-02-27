
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class EdisodesCard extends StatelessWidget {
  const EdisodesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        // physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Container(
                //   width: 74.r,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage("assets/images/pilot.png"),
                //         fit: BoxFit.cover),
                //   ),
                // ),
                Image.asset(
                  "assets/images/pilot.png",
                  width: 74.r,
                ),
                SizedBox(width: 16.w),
                Column(
                  children: [
                    Text(
                      "Серия 1",
                      style: TextHelper.w500s10
                          .copyWith(color: ColorHelper.bluew22A2BD),
                    ),
                    Text(
                      "Пилот",
                      style: TextHelper.w500s16
                          .copyWith(color: ColorHelper.CardNameColor),
                    ),
                    Text(
                      "gender",
                      style: TextHelper.w400s14
                          .copyWith(color: ColorHelper.grey6E798C),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
        separatorBuilder: ((context, index) => SizedBox(
              height: 24.h,
            )),
        itemCount: 7);
  }
}
