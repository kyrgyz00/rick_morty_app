import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features/rick_and_morty/presentation/screens/personage_screen/search_character_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: ((context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          // theme: ThemeData(),
          home: CharacterScreen(),
        );
      }),
    );
  }
}
