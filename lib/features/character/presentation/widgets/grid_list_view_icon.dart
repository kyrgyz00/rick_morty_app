import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class GridViewListviewIconCard extends StatelessWidget {
  const GridViewListviewIconCard({
    Key? key,
    required this.isListView,
  
  }) : super(key: key);

  final ValueNotifier<bool> isListView;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Всего персонажей: 200",
          style: TextHelper.w400s16
              .copyWith(color: ColorHelper.characterCountColor),
        ),
        IconButton(
          onPressed: (() {
            isListView.value = !isListView.value;
          }),
          icon: isListView.value
              ? Image.asset("assets/icon/menuIcon.png", width: 24.r)
              : Image.asset("assets/icon/rowMenuIcon.png", width: 24.r),
        )
      ],
    );
  }
}
