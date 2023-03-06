import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/bottom_nav_bar_widget.dart';
import 'package:rick_and_morty_app/features/character/presentation/logic/bloc/personage_bloc.dart';
import 'package:rick_and_morty_app/features/character/presentation/widgets/grid_list_view_character_cards.dart';
import 'package:rick_and_morty_app/internal/helpers/color_helper.dart';
import 'package:rick_and_morty_app/internal/helpers/error_helper.dart';

import '../../widgets/grid_list_view_icon.dart';
import '../../widgets/search_text_field_card.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final CharacterBloc personageBloc = CharacterBloc();

  ValueNotifier<bool> isListView = ValueNotifier(true);
  @override
  void initState() {
    personageBloc.add(GetCharacterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: BlocConsumer<CharacterBloc, CharacterState>(
        bloc: personageBloc,
        listener: (context, state) {
          if (state is ErrorsState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(getErrors(state.error))));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: ValueListenableBuilder(
              valueListenable: isListView,
              builder: ((context, value, child) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                }

                if (state is CharacterFetchedState) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SearchTextFieldWidget(hinttext: "Найти персонажа",),
                          Padding(
                            padding: EdgeInsets.only(top: 24.h, bottom: 28.h),
                            child: GridViewListviewIconCard(
                              isListView: isListView,
                              countOfCharacter:
                                  state.listOfCharacterModel.length,
                            ),
                          ),
                          GridLIstViewCharacter(
                            isListView: isListView,
                            charactermodelList: state.listOfCharacterModel,
                          )
                        ]),
                  );
                }
                return SizedBox();
              }),
            ),
          );
        },
      ),
    );
  }
}
