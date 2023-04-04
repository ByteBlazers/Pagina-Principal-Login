import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mecanico/View/menu.dart';
import 'package:mecanico/decoraciones/components/calendario.dart';
import 'package:mecanico/decoraciones/temas/modelThemes.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class homePag extends StatefulWidget {
  const homePag({super.key});

  @override
  State<homePag> createState() => _homePagState();
}

class _homePagState extends State<homePag> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  late final ahora = DateTime.now();
  late final fecha = DateFormat('yMEd').format(ahora);
  CalendarFormat formatoCalendario = CalendarFormat.month;
  DateTime diaSeleccionado = DateTime.now();
  DateTime diaHoy = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(builder: (context, ModelTheme tema, child) {
      final double ancho = MediaQuery.of(context).size.width;
      final double altura = MediaQuery.of(context).size.height;
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: RichText(
              text: const TextSpan(
                  text: 'Menu',
                  style: TextStyle(
                    fontSize: 24,
                  ))),
          actions: <Widget>[
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: 40,
                    width: 200,
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                            text: fecha,
                            style: const TextStyle(
                              fontSize: 24,
                            )))),
              ],
            )
          ],
        ),
        drawer: const menu(),
        body: Center(
          child: Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: tema.isDark ? Colors.blue : Colors.black,
                          width: 3))),
              width: 400,
              height: 350,
              child: TableCalendar(
                shouldFillViewport: true,
                firstDay: DateTime(2021),
                lastDay: DateTime(2030),
                focusedDay: diaHoy,
                calendarFormat: formatoCalendario,
                selectedDayPredicate: (day) {
                  return isSameDay(diaSeleccionado, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    diaSeleccionado = selectedDay;
                    diaHoy = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    formatoCalendario = format;
                  });
                },
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                calendarStyle: const CalendarStyle(
                  // defaultDecoration: BoxDecoration(color: Colors.blue,),
                  // rowDecoration: BoxDecoration(
                  //     border: Border(
                  //   bottom: BorderSide(color: Colors.blue),
                  //   top: BorderSide(color: Colors.blue),
                  //   // left: BorderSide(color: Colors.blue),
                  //   // right: BorderSide(color: Colors.blue),
                  // )),
                  todayDecoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: tema.isDark ? Colors.lightBlue : Colors.blue,
                    border: Border(
                        bottom: BorderSide(
                            color:
                                tema.isDark ? Colors.lightBlue : Colors.black,
                            width: 3))),
                height: 50,
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Proximas Citas',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ],
                )),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: tema.isDark ? Colors.black : Colors.white,
                        border: const Border(
                            bottom: BorderSide(color: Colors.blue, width: 5))),
                    height: 82,
                    width: ancho - 20,
                    child: Row(children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person,
                            color: Colors.blue,
                            size: 30,
                          )),
                      Text('${index + 1} Persona x'),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: 82,
                        width: 4,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Flexible(
                        child: RichText(
                            softWrap: true,
                            maxLines: 5,
                            overflow: TextOverflow.visible,
                            text: TextSpan(
                                text: 'Coche: Ford Lobo 2004'
                                    'Motivo de visita:          vxvxfvxvdf',
                                style: TextStyle(
                                    color: tema.isDark
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16))),
                      )
                    ]),
                  );
                },
              ),
            )
          ]),
        ),
      );
    });
  }
}
