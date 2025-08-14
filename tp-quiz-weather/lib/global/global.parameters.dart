import 'package:flutter/material.dart';
import 'package:demo_app_2/pages/home.page.dart';
import 'package:demo_app_2/pages/meteo.page.dart';
import 'package:demo_app_2/pages/quiz.page.dart';
class GlobalParameters {
  static final routes = <String, WidgetBuilder>{
    "/": (context) => HomePage(),
    "/meteo": (context) => MeteoPage(),
    "/quiz": (context) => QuizPage(), // minuscule
  };

  static final menus = [
    {"title": "Home",  "route": "/",       "icon": Icon(Icons.home)},
    {"title": "Quiz",  "route": "/quiz",   "icon": Icon(Icons.memory)}, // minuscule
    {"title": "Meteo", "route": "/meteo",  "icon": Icon(Icons.cloud)},
  ];
}
