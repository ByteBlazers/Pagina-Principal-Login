import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mecanico/View/menu.dart';
import 'package:mecanico/decoraciones/temas/modelThemes.dart';
import 'package:provider/provider.dart';

import 'homePagina.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animationCont;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double altura = MediaQuery.of(context).size.height;
    late final ahora = DateTime.now();

    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: width,
                height: altura + 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform(
                        transform: Matrix4.translationValues(
                            _animation.value * width,
                            _animation.value * altura,
                            0.0),
                        alignment: Alignment(width / 2, altura / 2),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(60),
                                  bottomRight: Radius.circular(60),
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          width: width,
                          height: 100,
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(
                                //   width: 50,
                                // ),
                                IconButton(
                                    iconSize: 34,
                                    onPressed: () {
                                      themeNotifier.isDark
                                          ? themeNotifier.isDark = false
                                          : themeNotifier.isDark = true;
                                    },
                                    icon: Icon(themeNotifier.isDark
                                        ? Icons.sunny
                                        : Icons.nightlight)),
                                Text(
                                    themeNotifier.isDark
                                        ? 'Modo Claro'
                                        : 'Modo Oscuro',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30)),
                              ],
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 100,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                        _animation.value * width,
                        0.0,
                        0.0,
                      ),
                      child: const Text(
                        "Bienvenido",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Transform(
                      transform: Matrix4.translationValues(
                        _animation.value * width,
                        0.0,
                        0.0,
                      ),
                      //***********************Iniciar sesion texto************************* */
                      child: SizedBox(
                        width: 250.0,
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              textStyle: const TextStyle(
                                color: Colors.blue,
                                fontSize: 24,
                              ),
                              'Iniciar Sesion:',
                              speed: const Duration(milliseconds: 100),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Transform(
                      transform: Matrix4.translationValues(
                        _animation.value * width,
                        0.0,
                        0.0,
                      ),
                      //**********************TEXTFIELD EMAIL O USUARIO********************** */
                      child: SizedBox(
                        width: 300.0,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            suffixIcon:
                                Icon(Icons.supervised_user_circle_rounded),
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Transform(
                      transform: Matrix4.translationValues(
                        _animation.value * width,
                        0.0,
                        0.0,
                      ),
                      //******************************Textfield Contraseña******************* */
                      child: SizedBox(
                        width: 300.0,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                    ),
                    //*********************BOTON INICIAR SESION*********************** */
                    const SizedBox(height: 50.0),
                    Transform(
                      transform: Matrix4.translationValues(
                        _animation.value * width,
                        0.0,
                        0.0,
                      ),
                      child: FloatingActionButton.extended(
                        icon: const Icon(
                          Icons.login,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return homePag();
                          }));
                        },
                        label: const Text('Iniciar Sesion'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
