import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';

import 'character_card.dart';
import 'gridview_character_card.dart';

class GridLIstViewCharacter extends StatelessWidget {
  final ValueNotifier<bool> isListView;
  final List<CharacterModel> charactermodelList;
  const GridLIstViewCharacter(
      {super.key, required this.isListView, required this.charactermodelList});

  @override
  Widget build(BuildContext context) {
    return isListView.value
        ? Expanded(
            child: ListView.separated(
                itemBuilder: ((context, index) {
                  return CharacterCard(
                    colorStatus: true,
                    charactermodelList: charactermodelList,
                    index: index,
                  );
                }),
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: 24.h,
                  );
                }),
                itemCount: charactermodelList.length),
          )
        : Expanded(
            child: GridView.builder(
              itemCount: charactermodelList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 226,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) => GridViewcaracterCard(
                colorStatus: true,
                charactermodelList: charactermodelList,
                index: index,
              ),
            ),
          );
  }
}
