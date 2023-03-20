import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class ChangeLoginWidget extends StatelessWidget {
  final String changeLogin;
  const ChangeLoginWidget({
    Key? key,
    required this.changeLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Логин",
                style: TextHelper.w400s16
                    .copyWith(color: ColorHelper.black0B1E2D)),
            Text(
              changeLogin,
              style: TextHelper.w400s14.copyWith(color: ColorHelper.grey828282),
            )
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: (() {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: ((context) =>
            // ChangeLoginWidget(changeLogin: changeLogin))));
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
