import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReporteEnergia {
  final DateTime fecha;
  final double voltaje;
  final double precio;

  ReporteEnergia({
    required this.fecha,
    required this.voltaje,
    required this.precio,
  });
}

class ElectricityChart extends StatelessWidget {
  final List<ReporteEnergia> reportes = [
    ReporteEnergia(fecha: DateTime.now(), voltaje: 120, precio: 15.00),
    ReporteEnergia(
        fecha: DateTime.now().subtract(Duration(days: 1)),
        voltaje: 110,
        precio: 12.00),
    ReporteEnergia(
        fecha: DateTime.now().subtract(Duration(days: 2)),
        voltaje: 115,
        precio: 14.00),
    // ... [Añade más reportes aquí si lo deseas]
  ];

  @override
  Widget build(BuildContext context) {
    int maxVoltajeIndex = 0;
    double maxVoltaje = reportes[0].voltaje;
    for (int i = 1; i < reportes.length; i++) {
      if (reportes[i].voltaje > maxVoltaje) {
        maxVoltaje = reportes[i].voltaje;
        maxVoltajeIndex = i;
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFF9c0444),
      body: SafeArea(
        child: Column(
          children: [
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color(0xFFa01c5c),
                            size: 27,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          'Gráfico de Energía',
                          style: TextStyle(
                            color: Color(0xFFa01c5c),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: Color(0xFFa01c5c),
                            size: 27,
                          ),
                          onPressed: () {
                            print('Configuración presionada');
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 3),
                                FlSpot(1, 1),
                                FlSpot(2, 2.5),
                                FlSpot(3, 1.5),
                                FlSpot(4, 3.5),
                              ],
                              isCurved: true,
                              colors: [Color(0xFFa01c5c)],
                              barWidth: 4,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                          titlesData: FlTitlesData(
                            leftTitles: SideTitles(showTitles: true),
                            bottomTitles: SideTitles(showTitles: true),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              left: BorderSide(color: Colors.transparent),
                              right: BorderSide(color: Colors.transparent),
                              top: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          gridData: FlGridData(show: false),
                          lineTouchData: LineTouchData(
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: Colors.blueAccent,
                            ),
                            touchCallback: (LineTouchResponse touchResponse) {},
                            handleBuiltInTouches: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: ListView.builder(
                  itemCount: reportes.length,
                  itemBuilder: (context, index) => Card(
                    margin: EdgeInsets.all(10),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      tileColor:
                          index == maxVoltajeIndex ? Colors.red[100] : null,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      title: Text(
                        DateFormat('dd/MM/yyyy').format(reportes[index].fecha),
                        style: TextStyle(
                          color: index == maxVoltajeIndex
                              ? Colors.red
                              : Color(0xFFa01c5c),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Voltaje: ${reportes[index].voltaje}V, Precio: \$${reportes[index].precio}",
                        style: TextStyle(
                          color: Color(0xFFa01c5c),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
