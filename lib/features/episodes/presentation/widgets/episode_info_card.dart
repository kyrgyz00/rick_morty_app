import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty_app/internal/helpers/color_helper.dart';
import 'package:rick_and_morty_app/internal/helpers/text_helpers.dart';

import 'episode_character_card.dart';

class EpisodeInfoCard extends StatelessWidget {
  final EpisodeModel episodeInfo;
  const EpisodeInfoCard({
    Key? key,
    required this.episodeInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 251.h),
      padding: EdgeInsets.only(top: 82.h),
      width: 375.w,
      // height: 800.h,
      decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.vertical(top: Radius.circular(26))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              episodeInfo.name!,
              style: TextHelper.w700s24,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 3.h,
              bottom: 36.h,
            ),
            child: Center(
              child: Text(
                "Серия ${episodeInfo.id}",
                style:
                    TextHelper.w500s10.copyWith(color: ColorHelper.bluew22A2BD),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.",
              style: TextHelper.w400s13,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 24.h,
              left: 16.w,
              right: 16.w,
            ),
            child: Text(
              "Премьера",
              style: TextHelper.w400s13.copyWith(color: ColorHelper.grey828282),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 36,
            ),
            child: Text(
              episodeInfo.airDate!,
              style:
                  TextHelper.w400s14.copyWith(color: ColorHelper.black0B1E2D),
            ),
          ),
          Divider(
            height: 2,
            thickness: 2,
            color: ColorHelper.greyF2F2F2,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 36.h,
              left: 16.w,
            ),
            child: Text(
              "Персонажы",
              style: TextHelper.w500s20,
            ),
          ),
          EpisodeCharacterCard(episodeModel: episodeInfo,)
        ],
      ),
    );
  }
}
