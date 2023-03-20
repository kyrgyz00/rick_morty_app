import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final List<CharacterModel> characterModelList;
  final String hinttext;
  const SearchTextFieldWidget({
    Key? key,
    required this.hinttext,
    required this.characterModelList,
  }) : super(key: key);

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  List<CharacterModel> searchCharacter = [];

  @override
  void initState() {
    searchCharacter = widget.characterModelList;
    
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  void runFilter(String text) async {
    final query = controller.text;
    List<CharacterModel> results = [];
    if (query.isEmpty) {
      results = widget.characterModelList;
    } else {
      results = widget.characterModelList
          .where(
              (user) => user.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      searchCharacter = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 49.h,
      child: TextField(
        controller: controller,
        onChanged: (value) => runFilter(value),
        decoration: InputDecoration(
          hintText: widget.hinttext,
          hintStyle: TextHelper.w400s16.copyWith(
            color: Color(0xffBDBDBD),
          ),
          filled: true,
          fillColor: ColorHelper.textFieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: ColorHelper.textFieldIconColor,
              size: 24.r,
            ),
          ),
          suffixIcon: SizedBox(
            width: 65,
            height: 49.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 14.w),
                  height: 24.h,
                  width: 1,
                  color: Color(0xffBDBDBD),
                ),
                Image.asset(
                  "assets/icon/suffixIcon.png",
                  width: 24.r,
                ),
                SizedBox(
                  width: 19.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
