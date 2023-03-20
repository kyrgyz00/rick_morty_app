import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';
import '../../data/models/character_model.dart';
import '../screens/character_screen/character_info_screen.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel characterModelList;
  // final bool colorStatus;
  // final int index;
  const CharacterCard({
    Key? key,
    // required this.colorStatus,
    required this.characterModelList,
    // required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => CharacterInfoscreen(
                      charactermodel: characterModelList,
                    ))));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CircleAvatar(
              radius: 37.r,
              child: Image.network(
                characterModelList.image.toString(),
              ),
            ),
          ),
          SizedBox(
            width: 18.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                characterModelList
                    .status
                    .toString()
                    .replaceFirst("Status.", ""),
                style: TextHelper.w500s10.copyWith(
                    color: characterModelList.status.toString() ==
                            "Status.ALIVE"
                        ? ColorHelper.CardStatusColorGreen
                        : characterModelList.status.toString() ==
                                "Status.UNKNOWN"
                            ? Colors.orange
                            : ColorHelper.CardStatusColorRed),
              ),
              Text(
                characterModelList.name.toString(),
                style: TextHelper.w500s16
                    .copyWith(color: ColorHelper.CardNameColor),
              ),
              Text(
                " ${characterModelList.species.toString().replaceFirst("Species.", "")}, ${characterModelList.gender.toString().replaceFirst("Gender.", "")}",
                style: TextHelper.w400s12
                    .copyWith(color: ColorHelper.CardGenderColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
