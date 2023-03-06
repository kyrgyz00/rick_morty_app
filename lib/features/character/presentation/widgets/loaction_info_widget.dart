import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class LocationInfoWidget extends StatelessWidget {
  final String location;
  final String title;
  const LocationInfoWidget({
    Key? key,
    required this.title,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextHelper.w400s12
                  .copyWith(color: ColorHelper.characterCountColor),
            ),
            Text(location, style: TextHelper.w400s14),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24.r,
            ))
      ],
    );
  }
}