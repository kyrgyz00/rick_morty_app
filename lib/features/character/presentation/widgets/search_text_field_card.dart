import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final String hinttext;
  final List<CharacterModel> characterModelList;
  const SearchTextFieldWidget({
    Key? key,
    required this.hinttext,
    required this.characterModelList,
  }) : super(key: key);

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

List<CharacterModel> searchcharacterModelList = [];

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    searchcharacterModelList = widget.characterModelList;
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  runFilter(String query) async {
    // query = controller.text;
    List<CharacterModel> results = [];
    if (query.isEmpty) {
      results = widget.characterModelList;
      // setState(() {});
    } else {
      results = widget.characterModelList
          .where(
              (user) => user.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      // setState(() {});
    }

    setState(() {
      searchcharacterModelList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 49.h,
      child: TextFormField(
        controller: controller,
        onChanged: (text) async{
          print("onchange");
            runFilter(text);
          setState(() {
          });
        },
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
