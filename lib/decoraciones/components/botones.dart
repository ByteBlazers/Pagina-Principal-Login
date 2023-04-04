import 'package:flutter/material.dart';

class boton1 extends StatefulWidget {
  const boton1({super.key});

  @override
  State<boton1> createState() => _boton1State();
}

class _boton1State extends State<boton1> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: build(context));
  }
}
