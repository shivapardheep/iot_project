import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GraphTwo extends StatefulWidget {
  final List listData;

  const GraphTwo({Key? key, required this.listData}) : super(key: key);
  @override
  State<GraphTwo> createState() => _GraphTwoState();
}

class _GraphTwoState extends State<GraphTwo> {
  //dio get data function
  // var fetchdata;
  // void getHttp() async {
  //   try {
  //     var response = await Dio().get(
  //         'http://www.randomnumberapi.com/api/v1.0/random?min=1&max=9&count=6');
  //     setState(() {
  //       fetchdata = response.data;
  //     });
  //   } catch (e) {
  //     print("error is : $e");
  //   }
  // }
  //
  // Future getData() async {
  //   final response = await http.get(Uri.parse(
  //       'http://www.randomnumberapi.com/api/v1.0/random?min=30&max=40&count=5'));
  //
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body.toString());
  //     setState(() {
  //       // fetchdata = data;
  //     });
  //     return data;
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }
  var fetchGetData;
  var fetchPostData;
  void getHttp() async {
    try {
      var response = await Dio().get(
          'https://bae4-2409-4072-618b-fcf8-9530-a1f8-eb3a-6ed0.ngrok.io/api/devices/?format=json');
      setState(() {
        fetchGetData = response.data;
      });
      // print(response.data[2]);
    } catch (e) {
      print(e);
    }
  }

  //post to get
  void postHttp() async {
    try {
      var response = await Dio().post(
          "https://bae4-2409-4072-618b-fcf8-9530-a1f8-eb3a-6ed0.ngrok.io/api/chart",
          data: {"device_id": "001"});
      setState(() {
        fetchPostData = response.data;
        fetchPostData = fetchPostData["temperature"];
        for (int i = 0; i < int.parse(fetchPostData.length.toString()); i++) {
          print("answer is : ${fetchPostData.length.toString()}");
        }
      });
      if (fetchPostData != null) {
        setState(() {
          startCreatingDemoData();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  late List list2;
  @override
  void initState() {
    super.initState();
    setChartData();
    getHttp();
    postHttp();
    list2 = widget.listData;
    // fetchPostData == null ? "" : startCreatingDemoData();
    // getData();
  }

  void startCreatingDemoData() async {
    print("Called");
    for (int i = 0; i < int.parse(fetchPostData.length.toString()); i++) {
      print(fetchPostData[i]);

      await Future.delayed((Duration(seconds: 1))).then(
        (value) {
          var a = double.parse(fetchPostData[i]).round() < 10
              ? 1
              : double.parse(fetchPostData[i]).round() < 20
                  ? 2
                  : double.parse(fetchPostData[i]).round() < 30
                      ? 3
                      : double.parse(fetchPostData[i]).round() < 40
                          ? 4
                          : double.parse(fetchPostData[i]).round() < 50
                              ? 5
                              : double.parse(fetchPostData[i]).round() < 60
                                  ? 6
                                  : double.parse(fetchPostData[i]).round() < 70
                                      ? 7
                                      : double.parse(fetchPostData[i]).round() <
                                              80
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
