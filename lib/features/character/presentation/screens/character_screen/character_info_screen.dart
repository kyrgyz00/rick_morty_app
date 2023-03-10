import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/internal/helpers/color_helper.dart';
import 'package:rick_and_morty_app/internal/helpers/text_helpers.dart';

import '../../../data/models/character_model.dart';
import '../../widgets/episodes_card.dart';
import '../../widgets/gender_race_card.dart';
import '../../widgets/loaction_info_widget.dart';
import '../../widgets/profile_stack_card.dart';

class CharacterInfoscreen extends StatelessWidget {
  final CharacterModel charactermodelList;
  const CharacterInfoscreen({
    super.key,
    required this.charactermodelList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileStackCard(image: charactermodelList.image.toString()),
            Text(
              charactermodelList.name.toString(),
              style: TextHelper.w400s34,
            ),
            SizedBox(height: 24.h),
            Text(
              charactermodelList.status.toString().replaceFirst("Status.", ""),
              style: TextHelper.w500s10.copyWith(
                  color: charactermodelList.status.toString() == "Status.ALIVE"
                      ? ColorHelper.CardStatusColorGreen
                      : charactermodelList.status.toString() == "Status.UNKNOWN"
                          ? Colors.amber
                          : ColorHelper.CardStatusColorRed),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                16.w,
                36.h,
                16.w,
                24.h,
              ),
              child: Text(
                "",
                style: TextHelper.w400s13,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GenderRaceCard(
                gender: charactermodelList.gender
                    .toString()
                    .replaceFirst("Gender.", ""),
                species: charactermodelList.species
                    .toString()
                    .replaceFirst("Species.", ""),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                16.w,
                20.h,
                16.w,
                24.h,
              ),
              child: LocationInfoWidget(
                location: charactermodelList.origin!.name.toString(),
                title: "Место рождения",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                16.w,
                0.h,
                16.w,
                36.h,
              ),
              child: LocationInfoWidget(
                title: "Местоположение",
                location: charactermodelList.location!.name.toString(),
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
            EdisodesCard(
              characterModel: charactermodelList,
            ),
          ],
        ),
      ),
    );
  }
}
