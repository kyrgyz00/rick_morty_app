import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rick_and_morty_app/internal/application.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("tokenBox");
  runApp(const MyApp());
}
