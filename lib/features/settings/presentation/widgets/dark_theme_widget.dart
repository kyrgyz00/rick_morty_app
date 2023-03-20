import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/internal/helpers/color_helper.dart';

class DarkThemeWidget extends StatefulWidget {
  const DarkThemeWidget({super.key});

  @override
  State<DarkThemeWidget> createState() => _DarkThemeWidgetState();
}

class _DarkThemeWidgetState extends State<DarkThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Container(
        width: 343.w,
        height: 322.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorHelper.whiteFFFFFF,
        ),
      )),
    );
  }
}
