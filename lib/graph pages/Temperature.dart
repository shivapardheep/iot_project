import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TemperatureGraph extends StatefulWidget {
  final List date;
  final List value;

  const TemperatureGraph({Key? key, required this.date, required this.value})
      : super(key: key);

  @override
  State<TemperatureGraph> createState() => _TemperatureGraphState();
}

class _TemperatureGraphState extends State<TemperatureGraph> {
  List<dynamic> _data = [];
  List<dynamic> _value = [];
  void checkfun() {
    setState(() {
      print("data is : ${_data.toString()}");
      print("value is : ${_value.toString()}");
    });
  }

  @override
  void initState() {
    super.initState();
    setChartData();
    _data = widget.date.toList();
    _value = widget.value.toList();
    checkfun();
    startCreatingDemoData();
  }

  void startCreatingDemoData() async {
    print("Called");
    for (int i = 0; i < int.parse(_value.length.toString()); i++) {
      // print("for loop values ${_value[i]}");

      await Future.delayed((Duration(seconds: 1))).then(
        (value) {
          var a = double.parse(_value[i]).round() < 10
              ? 1
              : double.parse(_value[i]).round() < 20
                  ? 2
                  : double.parse(_value[i]).round() < 30
                      ? 3
                      : double.parse(_value[i]).round() < 40
                          ? 4
                          : double.parse(_value[i]).round() < 50
                              ? 5
                              : double.parse(_value[i]).round() < 60
                                  ? 6
                                  : double.parse(_value[i]).round() < 70
                                      ? 7
                                      : double.parse(_value[i]).round() < 80
                                          ? 8
                                          : 9;
          flspots.add(
            FlSpot(
              double.parse(i.toString()),
              double.parse(a.toString()),
            ),
          );
          setState(() {
            setChartData();
            // print(random.nextDouble() * 8);
          });
        },
      );
    }
  }

  LineChartData data = LineChartData();
  void setChartData() {
    data = LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            // checkToShowTitle: ,
            getTitles: (value) {
              for (int i = 0; i < int.parse(_data.length.toString()); i++) {
                switch (value.toInt()) {
                  case 1:
                    return _data[0];
                  case 2:
                    return _data[1];
                  case 3:
                    return _data[2];
                  case 4:
                    return _data[3];
                  case 5:
                    return _data[4];
                  case 6:
                    return '';
                  case 7:
                    return '';
                }
              }
              return '';
            },
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff67727d),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            margin: 8,
          ),
          leftTitles: SideTitles(
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '1';
                case 2:
                  return '2';
                case 3:
                  return '3';
                case 4:
                  return '4';
                case 5:
                  return '5';
                case 6:
                  return '6';
                case 7:
                  return '7';
                case 8:
                  return '8';
                case 9:
                  return '9';
              }
              return '';
            },
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff67727d),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            reservedSize: 28,
            margin: 12,
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Color(0xff37434d), width: 1),
        ),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 9,
        lineBarsData: [
          LineChartBarData(
              spots: flspots,
              isCurved: true,
              colors: gradientColors,
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              )),
        ]);
  }

  List<FlSpot> flspots = [
    FlSpot(0, 1),
  ];

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return LineChart(data);
  }
}
