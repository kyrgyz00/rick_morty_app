import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'character_card.dart';
import 'gridview_character_card.dart';

class GridLIstViewCharacter extends StatelessWidget {
  final ValueNotifier<bool> isListView;
  const GridLIstViewCharacter({super.key, required this.isListView});

  @override
  Widget build(BuildContext context) {
    return isListView.value
        ? Expanded(
            child: ListView.separated(
                itemBuilder: ((context, index) {
                  return CharacterCard(
                    picture: "assets/images/_image_1.png",
                    name: "Директор Агентства",
                    status: "Живой",
                    gender: "Человек, Мужской",
                    colorStatus: true,
                  );
                }),
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: 24.h,
                  );
                }),
                itemCount: 10),
          )
        : Expanded(
            child: GridView.builder(
                itemCount: 30,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 226,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) => GridViewcaracterCard(
                      picture: "assets/images/_image_1.png",
                      name: "Директор Агентства",
                      status: "Живой",
                      gender: "Человек, Мужской",
                      colorStatus: true,
                    )),
          );
  }
}
