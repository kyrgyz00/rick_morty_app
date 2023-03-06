import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';

class ProfileStackCard extends StatelessWidget {
  final String image;
  const ProfileStackCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 375.w,
          height: 218.h,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 138,
            left: 122,
          ),
          width: 146.r,
          height: 146.r,
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(width: 10, color: ColorHelper.PictureBorderColor),
            ),
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
