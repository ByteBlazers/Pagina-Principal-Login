import 'package:shared_preferences/shared_preferences.dart';
import 'themes.dart';
import 'package:flutter/material.dart';

class ModelTheme extends ChangeNotifier {
  late bool _oscuro;
  late temasDePreferencia _preferencias;
  bool get isDark => _oscuro;

  ModelTheme() {
    _oscuro = false;
    _preferencias = temasDePreferencia();
    getPreferences();
  }
//***Cambiando Temas a oscuro***** */
  set isDark(bool value) {
    _oscuro = value;
    _preferencias.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _oscuro = await _preferencias.getTheme();
    notifyListeners();
  }
}

//*************variable oscuro dice si esta en modo oscuro o no*************** */
//**************_preferencias es una instancia de la clase themes ****** */