import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphTwo extends StatefulWidget {
  const GraphTwo({Key? key}) : super(key: key);

  @override
  State<GraphTwo> createState() => _GraphTwoState();
}

class _GraphTwoState extends State<GraphTwo> {
  @override
  void initState() {
    super.initState();
    setChartData();
    startCreatingDemoData();
  }

  void startCreatingDemoData() async {
    for (int i = 0; i < 6; i++) {
      if (i == 0) continue;
      await Future.delayed((Duration(seconds: 1))).then(
        (value) {
          Random random = Random();
          flspots.add(
            FlSpot(
              double.parse(i.toString()),
              random.nextDouble() * 8.toInt() <= 3
                  ? 5.0
                  : random.nextDouble() * 8.toInt() <= 6
                      ? 7.0
                      : 8.0,
            ),
          );
          setState(() {
            setChartData();
            print(random.nextDouble() * 8);
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
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return 'M 10';
                case 2:
                  return 'M 11';
                case 3:
                  return 'M 12';
                case 4:
                  return 'M 13';
                case 5:
                  return 'M 14';
                case 6:
                  return 'M 15';
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
                  return '30';
                case 2:
                  return '31';
                case 3:
                  return '32';
                case 4:
                  return '33';
                case 5:
                  return '34';
                case 6:
                  return '35';
                case 7:
                  return '36';
                case 8:
                  return '37';
                case 9:
                  return '38';
                case 10:
                  return '39';
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
        maxX: 5,
        minY: 0,
        maxY: 10,
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
    FlSpot(0, 2),
  ];

  List<Color> gradientColors = [
    const Color(0xffEC9F05),
    const Color(0xffFF4E00),
  ];
  @override
  Widget build(BuildContext context) {
    return LineChart(data);
  }
}
