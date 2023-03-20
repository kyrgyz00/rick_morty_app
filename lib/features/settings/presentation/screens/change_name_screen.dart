import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/internal/helpers/color_helper.dart';
import 'package:rick_and_morty_app/internal/helpers/text_helpers.dart';

import '../widgets/textfield_widget.dart';

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
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: ColorHelper.black0B1E2D,
        ),
        title: Text(
          "Изменить ФИО",
          style: TextHelper.w500s20.copyWith(color: ColorHelper.black0B1E2D),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 319.w,
        height: 48.h,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorHelper.bluew22A2BD,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Text(
            "Сохранить",
            style: TextHelper.w400s16.copyWith(color: ColorHelper.whiteFFFFFF),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 28.w,
          vertical: 61.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Имя",
              style:
                  TextHelper.w400s14.copyWith(color: ColorHelper.black0B1E2D),
            ),
            SizedBox(height: 8.h),
            TextFieldWidget(
              hintText: "Имя",
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                bottom: 8.h,
              ),
              child: Text("Фамилия",
                  style: TextHelper.w400s14
                      .copyWith(color: ColorHelper.black0B1E2D)),
            ),
            TextFieldWidget(
              hintText: "Фамилия",
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                bottom: 8.h,
              ),
              child: Text(
                "Отечесво",
                style:
                    TextHelper.w400s14.copyWith(color: ColorHelper.black0B1E2D),
              ),
            ),
            TextFieldWidget(
              hintText: "Отечесво",
            ),
          ],
        ),
      )),
    );
  }
}
