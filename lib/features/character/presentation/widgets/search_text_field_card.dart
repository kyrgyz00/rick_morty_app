import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class SearchTextFieldWidget extends StatelessWidget {
   TextEditingController controller = TextEditingController();
  final String hinttext;
   SearchTextFieldWidget({
    Key? key,
    required this.hinttext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 49.h,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextHelper.w400s16.copyWith(
            color: Color(0xffBDBDBD),
          ),
          filled: true,
          fillColor: ColorHelper.textFieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: ColorHelper.textFieldIconColor,
              size: 24.r,
            ),
          ),
          suffixIcon: SizedBox(
            width: 65,
            height: 49.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 14.w),
                  height: 24.h,
                  width: 1,
                  color: Color(0xffBDBDBD),
                ),
                Image.asset(
                  "assets/icon/suffixIcon.png",
                  width: 24.r,
                ),
                SizedBox(
                  width: 19.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
