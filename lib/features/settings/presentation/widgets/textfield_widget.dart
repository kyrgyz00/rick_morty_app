import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  const TextFieldWidget({
    Key? key, required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 319.w,
      height: 48.h,
      child: TextFormField(
        
        decoration: InputDecoration(
          hintText: hintText,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: ColorHelper.greyF2F2F2),
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: ColorHelper.greyF2F2F2,
            filled: true),
      ),
    );
  }
}
