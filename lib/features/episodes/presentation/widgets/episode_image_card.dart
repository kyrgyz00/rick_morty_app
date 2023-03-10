
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EpisodeImageCard extends StatelessWidget {
  const EpisodeImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 375.w,
          height: 298.h,
          child: Image.asset(
            "assets/images/Rectangle111.png",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 248.h),
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
        )
      ],
    );
  }
}
