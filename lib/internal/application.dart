import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/splash_screen/splash_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: ((context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          home: SplashPage(),
        );
      }),
    );
  }
}
