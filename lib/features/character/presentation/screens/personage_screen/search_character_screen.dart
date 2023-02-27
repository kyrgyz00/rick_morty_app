import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/presentation/logic/bloc/personage_bloc.dart';
import 'package:rick_and_morty_app/features/character/presentation/widgets/grid_list_view_character_cards.dart';
import 'package:rick_and_morty_app/internal/helpers/color_helper.dart';
import 'package:rick_and_morty_app/internal/helpers/error_helper.dart';

import '../../widgets/grid_list_view_icon.dart';
import '../../widgets/search_character_card.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  // bool isActive = true;
  final PersonageBloc personageBloc = PersonageBloc();
  int widgetIndex = 0;
  List<Widget> ListOfPages = [];
  void onItemSelected(int index) {
    widgetIndex = index;
  }

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
      body: BlocConsumer<PersonageBloc, PersonageState>(
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

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SearchCharaccterWidget(),
                        Padding(
                          padding: EdgeInsets.only(top: 24.h, bottom: 28.h),
                          child: GridViewListviewIconCard(
                            isListView: isListView,
                          ),
                        ),
                        GridLIstViewCharacter(isListView: isListView)
                      ]),
                );
              }),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: widgetIndex,
        onTap: (index) {
          widgetIndex = index;
          setState(() {});
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            label: "Персонажи",
            icon: Image.asset(
              "assets/icon/Subtract.png",
              width: 24.r,
              color: ColorHelper.bottomNavIconColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Локациии",
            icon: Image.asset(
              "assets/icon/location_24px.png",
              width: 24.r,
              color: ColorHelper.bottomNavIconColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Эпизоды",
            icon: Image.asset(
              "assets/icon/episode.png",
              width: 24.r,
              color: ColorHelper.bottomNavIconColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Настройки",
            icon: Image.asset(
              "assets/icon/setting.png",
              width: 24.r,
              color: ColorHelper.bottomNavIconColor,
            ),
          ),
        ],
      ),
    );
  }
}
