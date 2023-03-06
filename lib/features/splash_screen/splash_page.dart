import 'package:flutter/material.dart';

import '../../bottom_nav_bar_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/start_page.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Future navigate() async {
    // var box = Hive.box("tokenBox");
    // String token = box.get("token", defaultValue: "");
    await Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => BottomNavBarWidget()),
            )));
  }
}
