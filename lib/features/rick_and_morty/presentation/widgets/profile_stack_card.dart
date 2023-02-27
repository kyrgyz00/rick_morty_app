
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';

class ProfileStackCard extends StatelessWidget {
  const ProfileStackCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          SizedBox(
            width: 375.w,
            height: 218.h,
            child: Image.asset(
              "assets/images/_image_.png",
              // width: 375.w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 24.w,
            top: 61.h,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 24.r,
              ),
            ),
          ),
          Positioned(
            top: 145.h,
            left: 114.w,
            child: Container(
              width: 146.r,
              height: 146.r,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                      width: 10, color: ColorHelper.PictureBorderColor),
                ),
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/_image_.png",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
