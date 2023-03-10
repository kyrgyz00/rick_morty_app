import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class EdisodesCard extends StatelessWidget {
  final CharacterModel characterModel;
  const EdisodesCard({
    Key? key,
    required this.characterModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
                  "assets/images/_image_1.png",
                  width: 74.r,
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                Spacer(),
                IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.navigate_next_outlined))
              ],
            ),
          );
        }),
        separatorBuilder: ((context, index) => SizedBox(
              height: 24.h,
            )),
        itemCount: 10);
  }
}
