import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/settings/presentation/widgets/change_login_widget.dart';
import 'package:rick_and_morty_app/internal/helpers/color_helper.dart';
import 'package:rick_and_morty_app/internal/helpers/text_helpers.dart';

import '../widgets/change_name_widget.dart';

class ChangeNameScreen extends StatefulWidget {
  const ChangeNameScreen({super.key});

  @override
  State<ChangeNameScreen> createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          color: ColorHelper.black0B1E2D,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Редактировать профиль",
          style: TextHelper.w500s20.copyWith(color: ColorHelper.black0B1E2D),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 40.h,
            horizontal: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/_image_3.png",
                  height: 150.r,
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    bottom: 40.h,
                  ),
                  child: TextButton(
                    onPressed: (() {}),
                    child: Text(
                      "Изменить фото",
                      style: TextHelper.w400s16
                          .copyWith(color: ColorHelper.bluew22A2BD),
                    ),
                  ),
                ),
              ),
              Text(
                "Профиль",
                style:
                    TextHelper.w500s10.copyWith(color: ColorHelper.grey828282),
              ),
              SizedBox(height: 24.h),
              ChangeNameWidget(
                changeText: "Oleg Belotserkovsky",
              ),
              SizedBox(height: 20.h),
              ChangeLoginWidget(changeLogin: "Rick")
            ],
          ),
        ),
      ),
    );
  }
}
