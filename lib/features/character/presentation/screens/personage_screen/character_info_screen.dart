import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/internal/helpers/color_helper.dart';
import 'package:rick_and_morty_app/internal/helpers/text_helpers.dart';

import '../../widgets/episodes_card.dart';
import '../../widgets/gender_race_card.dart';
import '../../widgets/profile_stack_card.dart';

class CharacterInfoscreen extends StatelessWidget {
  const CharacterInfoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileStackCard(),
            Text(
              "Рик Cанчез",
              style: TextHelper.w400s34,
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Живой".toUpperCase(),
              style: TextHelper.w500s10
                  .copyWith(color: ColorHelper.CardStatusColorGreen),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                16.w,
                36.h,
                16.w,
                24.h,
              ),
              child: Text(
                "Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.",
                style: TextHelper.w400s13,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GenderRaceCard(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 24.h),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Место рождения",
                        style: TextHelper.w400s12
                            .copyWith(color: ColorHelper.characterCountColor),
                      ),
                      Text("Земля C-137", style: TextHelper.w400s14),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 24.r,
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 36.h),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Местоположение",
                        style: TextHelper.w400s12
                            .copyWith(color: ColorHelper.characterCountColor),
                      ),
                      Text("Земля (Измерение подменны)",
                          style: TextHelper.w400s14),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 24.r,
                      ))
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: ColorHelper.grey6,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                16.w,
                36.h,
                16.w,
                24.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Эпизоды",
                    style: TextHelper.w500s20,
                  ),
                  Text(
                    "Все эпизоды",
                    style: TextHelper.w400s12
                        .copyWith(color: ColorHelper.grey828282),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 375.w,
              child: EdisodesCard(),
            )
          ],
        ),
      ),
    );
  }
}
