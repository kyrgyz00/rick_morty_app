import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/settings/presentation/screens/settings_screen.dart';
import 'features/character/presentation/screens/character_screen/list_characters_screen.dart';
import 'features/episodes/presentation/screens/list_episodes_screen.dart';
import 'features/location/presentaion/screens/location_screen/list_location_screen.dart';
import 'internal/helpers/color_helper.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedTab = 0;
  void onItemSelected(int index) {
    if (_selectedTab == index) {
      setState(() {});
    }
    _selectedTab = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          CharacterScreen(),
          ListLocationScreen(),
          EpisodesScreen(),
          SettingsScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 40,
        selectedItemColor: Color(0xff22A2BD),
        backgroundColor: Colors.white,
        currentIndex: _selectedTab,
        onTap: onItemSelected,
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
          BottomNavigationBarItem(
            label: "Настройки",
            icon: Image.asset(
              "assets/icon/setting.png",
              width: 24.r,
            ),
          ),
        ],
      ),
    );
  }
}
