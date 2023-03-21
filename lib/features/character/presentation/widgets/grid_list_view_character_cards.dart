import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/presentation/widgets/search_text_field_card.dart';

import 'character_card.dart';
import 'gridview_character_card.dart';

class GridLIstViewCharacter extends StatelessWidget {
  final ValueNotifier<bool> isListView;
  // final List<CharacterModel> characterModelList;
  const GridLIstViewCharacter({
    super.key,
    required this.isListView,
    // required this.characterModelList,
  });

  @override
  Widget build(BuildContext context) {
    
    return searchcharacterModelList.isNotEmpty
        ? isListView.value
            ? Expanded(
                child: ListView.separated(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: ((context, index) {
                      return CharacterCard(
                        // colorStatus: true,
                        characterModelList: searchcharacterModelList[index],
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return SizedBox(
                        height: 24.h,
                      );
                    }),
                    itemCount: searchcharacterModelList.length),
              )
            : Expanded(
                child: GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: searchcharacterModelList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 226,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => GridViewcaracterCard(
                    colorStatus: true,
                    charactermodel: searchcharacterModelList[index],
                    index: index,
                  ),
                ),
              )
        : const Text(
            'No results found',
            style: TextStyle(fontSize: 24),
          );
  }
}
