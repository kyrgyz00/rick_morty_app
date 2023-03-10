import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';
import '../../data/models/character_model.dart';
import '../screens/character_screen/character_info_screen.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel charactermodelList;
  // final bool colorStatus;
  // final int index;
  const CharacterCard({
    Key? key,
    // required this.colorStatus,
    required this.charactermodelList,
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
                      charactermodelList: charactermodelList,
                    ))));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CircleAvatar(
              radius: 37.r,
              child: Image.network(
                charactermodelList.image.toString(),
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
                charactermodelList.name.toString(),
                style: TextHelper.w500s16
                    .copyWith(color: ColorHelper.CardNameColor),
              ),
              Text(
                " ${charactermodelList.species.toString().replaceFirst("Species.", "")}, ${charactermodelList.gender.toString().replaceFirst("Gender.", "")}",
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
