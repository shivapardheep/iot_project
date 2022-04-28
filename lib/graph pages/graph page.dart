import 'package:flutter/material.dart';

import 'graph 1 phdata.dart';
import 'graph 2 temp.dart';
import 'graph 3 soil.dart';

class GraphPage extends StatefulWidget {
  final List listData;

  const GraphPage({Key? key, required this.listData}) : super(key: key);
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  static const List _datas = [
    "10 am",
    "11 am",
    "12 pm",
    "1 am",
    "2 am",
    "3 am",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Ph Data",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 200,
                    // width: MediaQuery.of(context).size.width * .9,
                    child: GraphOne(
                      date: [_datas],
                    ),
                  ),
                ),
                Text(
                  "Temprature",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 200,
                    // width: MediaQuery.of(context).size.width * .9,
                    child: GraphTwo(
                      listData: [],
                    ),
                  ),
                ),
                Text(
                  "Soil Moiture",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 200,
                    // width: MediaQuery.of(context).size.width * .9,
                    child: GraphThree(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
