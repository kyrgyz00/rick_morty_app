import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayIconWidget extends StatelessWidget {
  const PlayIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 201.h),
      height: 99.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 10)],
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Icon(
        Icons.play_arrow_rounded,
        size: 75.r,
        color: Color(0xffFFFFFF),
      ),
    );
  }
}
