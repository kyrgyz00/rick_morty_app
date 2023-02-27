import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';
import '../screens/personage_screen/character_info_screen.dart';

class CharacterCard extends StatelessWidget {
  final String picture;
  final bool colorStatus;
  final String name;
  final String status;
  final String gender;
  const CharacterCard({
    Key? key,
    required this.picture,
    required this.name,
    required this.status,
    required this.gender,
    required this.colorStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => CharacterInfoscreen())));
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 37.r,
            child: Image.asset(picture),
          ),
          SizedBox(
            width: 18.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: TextHelper.w500s10.copyWith(
                    color: colorStatus
                        ? ColorHelper.CardStatusColorGreen
                        : ColorHelper.CardStatusColorRed),
              ),
              Text(
                name,
                style: TextHelper.w500s16
                    .copyWith(color: ColorHelper.CardNameColor),
              ),
              Text(
                gender,
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
