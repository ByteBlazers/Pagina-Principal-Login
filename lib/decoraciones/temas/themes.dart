import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class temasDePreferencia {
  static const llaveDeTemas = "theme_key";

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(llaveDeTemas, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(llaveDeTemas) ?? false;
  }
}
