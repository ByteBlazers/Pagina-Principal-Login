import 'package:flutter/material.dart';
import 'package:mecanico/decoraciones/temas/modelThemes.dart';
import 'package:provider/provider.dart';

class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme modelTheme, child) {
      return Drawer(
        backgroundColor: modelTheme.isDark ? Colors.black : Colors.blue,
        width: 300,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Colors.white, width: 10),
                      borderRadius: BorderRadius.circular(150)),
                  child: ClipOval(
                    child: Image.asset('decoracion/images/nubes_neon.jpg',
                        scale: 6),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('AUTOMOTRIZ MARTINEZ',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    )),
                const SizedBox(
                  height: 50,
                ),
                //*****************************Botones de menu****************************** */
                //*****************************Boton de Agenda****************************** */
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 3)),
                  ),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.date_range, color: Colors.white, size: 34),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Agenda',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //*****************************Boton de Inventario****************************** */
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 3)),
                  ),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.inventory_rounded,
                            color: Colors.white, size: 34),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Inventario',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //*****************************Boton de Ventas****************************** */
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 3)),
                  ),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.receipt_long_outlined,
                            color: Colors.white, size: 34),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Ventas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //*****************************Boton de Servicios****************************** */
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 3)),
                  ),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.fiber_manual_record_sharp,
                            color: Colors.white, size: 34),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Servicios',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //*****************************Boton de Cerrar Sesion****************************** */
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.red, width: 3)),
                  ),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.logout, color: Colors.white, size: 34),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Cerrar Sesion',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    IconButton(
                        iconSize: 34,
                        onPressed: () {
                          modelTheme.isDark
                              ? modelTheme.isDark = false
                              : modelTheme.isDark = true;
                        },
                        icon: Icon(
                          modelTheme.isDark ? Icons.sunny : Icons.nightlight,
                          color: modelTheme.isDark ? Colors.blue : Colors.white,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
