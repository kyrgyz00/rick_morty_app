import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class GenderRaceCard extends StatelessWidget {
  final String gender;
  final String species;
  const GenderRaceCard({
    Key? key,
    required this.gender,
    required this.species,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Пол",
              style: TextHelper.w400s12
                  .copyWith(color: ColorHelper.characterCountColor),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              gender,
              style: TextHelper.w400s14,
            ),
          ],
        ),
        SizedBox(
          width: 118.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Расса",
              style: TextHelper.w400s12
                  .copyWith(color: ColorHelper.characterCountColor),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              species,
              style: TextHelper.w400s14,
            )
          ],
        ),
      ],
    );
  }
}
