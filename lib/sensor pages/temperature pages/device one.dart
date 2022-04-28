import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../graph pages/graph 2 temp.dart';

class DOne extends StatefulWidget {
  const DOne({Key? key}) : super(key: key);

  @override
  State<DOne> createState() => _DOneState();
}

class _DOneState extends State<DOne> {
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
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Graphwidget(context, date: "Today 27/04/2022"),
        const SizedBox(
          height: 30,
        ),
        Graphwidget(context, date: "Yesterday 26/04/2022"),
        const SizedBox(
          height: 30,
        ),
        Graphwidget(context, date: "This week 7 days"),
      ],
    );
  }

  Column Graphwidget(BuildContext context, {date}) {
    return Column(
      children: [
        Text(
          date,
          style:
              GoogleFonts.anton().copyWith(fontSize: 20, color: Colors.white70),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 30,
            child: GraphTwo(
              listData: [],
            )),
      ],
    );
  }
}
