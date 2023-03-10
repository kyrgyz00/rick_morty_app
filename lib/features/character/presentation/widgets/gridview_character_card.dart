import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';
import '../screens/character_screen/character_info_screen.dart';

class GridViewcaracterCard extends StatelessWidget {
  final CharacterModel charactermodelList;
  final bool colorStatus;
  final int index;

  const GridViewcaracterCard({
    Key? key,
    required this.colorStatus,
    required this.charactermodelList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => CharacterInfoscreen(
                      charactermodelList: charactermodelList,
                    ))));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CircleAvatar(
              radius: 60.r,
              child: Image.network(charactermodelList.image!),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            charactermodelList
                .status
                .toString()
                .replaceFirst("Status.", ""),
            style: TextHelper.w500s10.copyWith(
                color: charactermodelList.status.toString() ==
                        "Status.ALIVE"
                    ? ColorHelper.CardStatusColorGreen
                    : charactermodelList.status.toString() ==
                            "Status.UNKNOWN"
                        ? Colors.orange
                        : ColorHelper.CardStatusColorRed),
          ),
          Text(
            charactermodelList.name!,
            style:
                TextHelper.w500s14.copyWith(color: ColorHelper.CardNameColor),
          ),
          Text(
            charactermodelList
                .gender
                .toString()
                .replaceFirst("Gender.", ""),
            style:
                TextHelper.w400s12.copyWith(color: ColorHelper.CardGenderColor),
                textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
