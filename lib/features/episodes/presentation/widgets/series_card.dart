import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';
import '../screens/episode_info_screen.dart';

class SeriesCard extends StatelessWidget {
  final List<EpisodeModel> episodeModel;
  const SeriesCard({
    Key? key,
    required this.episodeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 24.h),
        itemBuilder: ((context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => EpisodeInfoScreen(
                              episodeInfo: episodeModel[index],
                            ))));
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/pilot.png",
                      width: 60.r,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Серия ${index + 1}",
                        style: TextHelper.w500s10
                            .copyWith(color: ColorHelper.bluew22A2BD),
                      ),
                      Text(
                        episodeModel[index].name!,
                        style: TextHelper.w500s16
                            .copyWith(color: ColorHelper.CardNameColor),
                      ),
                      Text(
                        episodeModel[index].airDate!,
                        style: TextHelper.w400s14
                            .copyWith(color: ColorHelper.grey6E798C),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        separatorBuilder: ((context, index) => SizedBox(height: 24.h)),
        itemCount: episodeModel.length);
  }
}
