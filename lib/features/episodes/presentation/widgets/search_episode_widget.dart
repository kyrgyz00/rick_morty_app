import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class SearchEpisodeWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String hinttext;
  SearchEpisodeWidget({
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
            borderSide: BorderSide(width: 0),
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
        ),
      ),
    );
  }
}
