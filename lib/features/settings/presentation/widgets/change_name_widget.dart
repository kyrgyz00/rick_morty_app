import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';
import '../screens/change_name_screen.dart';

class ChangeNameWidget extends StatelessWidget {
 
  final String changeText;
  const ChangeNameWidget({
    Key? key,
    required this.changeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Изменить ФИО",
                style: TextHelper.w400s16
                    .copyWith(color: ColorHelper.black0B1E2D)),
            Text(
              changeText,
              style: TextHelper.w400s14.copyWith(color: ColorHelper.grey828282),
            )
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: (() {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => ChangeNameScreen())));
          }),
          icon: Icon(
            Icons.navigate_next_outlined,
            size: 30.r,
          ),
        )
      ],
    );
  }
}
