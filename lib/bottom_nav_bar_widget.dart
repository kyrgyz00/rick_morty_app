import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/character/presentation/screens/character_screen/list_characters_screen.dart';
import 'features/episodes/presentation/screens/list_episodes_screen.dart';
import 'features/location/presentaion/screens/location_screen/list_location_screen.dart';
import 'internal/helpers/color_helper.dart';

class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int widgetIndex = 0;
  void onItemSelected(int index) {
    widgetIndex = index;
    setState(() {});
  }

  List<Widget> ListOfPages = [
    CharacterScreen(),
    ListLocationScreen(),
    EpisodesScreen(),
    // CharacterScreen(),
    // ListLocationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListOfPages.elementAt(widgetIndex),
      bottomNavigationBar: BottomNavigationBar(
        // selectedLabelStyle: TextStyle(color: Color(0xff22A2BD)),
        selectedItemColor: Color(0xff22A2BD),
        // unselectedItemColor: Color(0xffBDBDBD),
        backgroundColor: Colors.white,
        currentIndex: widgetIndex,
        onTap: onItemSelected,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            label: "Персонажи",
            activeIcon: Image.asset(
              "assets/icon/Subtract.png",
              width: 24.r,
              color: Color(0xff22A2BD),
            ),
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
            ),
          ),
          BottomNavigationBarItem(
            label: "Эпизоды",
            icon: Image.asset(
              "assets/icon/episode.png",
              width: 24.r,
            ),
          ),
          // BottomNavigationBarItem(
          //   label: "Настройки",
          //   icon: Image.asset(
          //     "assets/icon/setting.png",
          //     width: 24.r,
          //   ),
          // ),
        ],
      ),
    );
  }
}
