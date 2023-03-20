import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/internal/helpers/color_helper.dart';
import 'package:rick_and_morty_app/internal/helpers/text_helpers.dart';
import 'edit_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Настройки",
          style: TextHelper.w500s20.copyWith(
            color: ColorHelper.black0B1E2D,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 35.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/_image_3.png",
                      height: 80.r,
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Oleg Belotserkovsky",
                          style: TextHelper.w400s16,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Rick",
                          style: TextHelper.w400s14
                              .copyWith(color: ColorHelper.grey828282),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.h),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHelper.whiteE5E5E5,
                          elevation: 0,
                          fixedSize: Size(
                            335.w,
                            40.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                          side: BorderSide(
                            width: 1,
                            color: ColorHelper.bluew22A2BD,
                          )),
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ChangeNameScreen())));
                      }),
                      child: Text(
                        "Редактировать",
                        style: TextHelper.w400s16
                            .copyWith(color: ColorHelper.bluew22A2BD),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: ColorHelper.greyF2F2F2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 36.h,
                    bottom: 24.h,
                  ),
                  child: Text(
                    "Внешний вид".toUpperCase(),
                    style: TextHelper.w500s10
                        .copyWith(color: ColorHelper.grey828282),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/icon/icon_theme.png",
                      height: 36.r,
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Тёмная тема",
                          style: TextHelper.w400s16,
                        ),
                        Text(
                          "Включена",
                          style: TextHelper.w400s14
                              .copyWith(color: ColorHelper.grey828282),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: (() {}),
                      icon: Icon(
                        Icons.navigate_next_outlined,
                        size: 24.r,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 36.h),
                  child: Divider(
                    thickness: 1,
                    color: ColorHelper.greyF2F2F2,
                  ),
                ),
                Text(
                  "О приложении".toUpperCase(),
                  style: TextHelper.w500s10
                      .copyWith(color: ColorHelper.grey828282),
                ),
                SizedBox(height: 24.h),
                const Text(
                    "Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи."),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 36.h),
                  child: Divider(
                    thickness: 1,
                    color: ColorHelper.greyF2F2F2,
                  ),
                ),
                Text(
                  "Версия приложении".toUpperCase(),
                  style: TextHelper.w500s10
                      .copyWith(color: ColorHelper.grey828282),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Rick & Morty  v1.0.0",
                  style: TextHelper.w400s13
                      .copyWith(color: ColorHelper.black0B1E2D),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
