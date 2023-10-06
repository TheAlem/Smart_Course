import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitchedOn = false;
  List<HistorialItem> historial = [];

  void toggleSwitch() {
    setState(() {
      isSwitchedOn = !isSwitchedOn;
      historial.insert(
        0,
        HistorialItem(
          dateTime: DateTime.now(),
          estado: isSwitchedOn ? 'Abierto' : 'Cerrado',
          nombre: 'Juan Perez',
          rol: 'Docente',
        ),
      );
      if (historial.length > 4) {
        historial = historial.sublist(0, 4);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9c0444),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.all(25),
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Color(0xFFa01c5c),
                              size: 27,
                            ),
                            onPressed: () {
                              print('Menú presionado');
                            },
                          ),
                          const Text(
                            'Control de Acceso',
                            style: TextStyle(
                              color: Color(0xFFa01c5c),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: toggleSwitch,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (widget, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: widget,
                          );
                        },
                        child: Icon(
                          isSwitchedOn ? Icons.lock_open : Icons.lock_outline,
                          color:
                              isSwitchedOn ? Colors.yellow : Color(0xFFa01c5c),
                          size: 100,
                          key: ValueKey<bool>(isSwitchedOn),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      isSwitchedOn ? 'Abierto' : 'Cerrado',
                      style: const TextStyle(
                        color: Color(0xFFa01c5c),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: ListView.builder(
                    itemCount: historial.length,
                    itemBuilder: (context, index) => Card(
                      margin: EdgeInsets.all(10),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: historial[index].estado == 'Abierto'
                              ? [
                                  BoxShadow(
                                    color: Colors.yellow.withOpacity(0.6),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: Offset(0, 0),
                                  )
                                ]
                              : [],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          title: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat('dd/MM/yyyy')
                                          .format(historial[index].dateTime),
                                      style: TextStyle(
                                        color: Color(0xFFa01c5c),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('HH:mm')
                                          .format(historial[index].dateTime),
                                      style: TextStyle(
                                        color: Color(0xFFa01c5c),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Color(0xFFa01c5c),
                                  thickness: 2,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${historial[index].nombre}    ${historial[index].rol}",
                                      style: TextStyle(
                                        color: Color(0xFFa01c5c),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${historial[index].estado}",
                                      style: TextStyle(
                                        color: Color(0xFFa01c5c),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class HistorialItem {
  final DateTime dateTime;
  final String estado;
  final String nombre;
  final String rol;

  HistorialItem({
    required this.dateTime,
    required this.estado,
    required this.nombre,
    required this.rol,
  });
}
