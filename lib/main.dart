import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mecanico/decoraciones/temas/modelThemes.dart';
import 'package:mecanico/View/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp(
            color: Colors.blue,
            title: 'Mecanico',
            theme: themeNotifier.isDark
                ? ThemeData(
                    colorScheme: const ColorScheme(
                    background: Colors.black,
                    brightness: Brightness.dark,
                    primary: Colors.blue,
                    onBackground: Colors.white,
                    onError: Colors.black,
                    error: Colors.red,
                    onPrimary: Colors.black,
                    onSecondary: Colors.blue,
                    secondary: Colors.white,
                    surface: Colors.black,
                    onSurface: Colors.blue,
                  ))
                : ThemeData(
                    colorScheme: const ColorScheme(
                    background: Colors.white,
                    onBackground: Colors.black,
                    brightness: Brightness.light,
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    onError: Colors.white,
                    error: Colors.red,
                    onSecondary: Colors.white,
                    secondary: Colors.blue,
                    surface: Colors.white,
                    onSurface: Colors.blue,
                  )),
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
