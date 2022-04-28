import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/UrlPage/urlpage.dart';
import 'package:iot_project/graph%20pages/Humidity.dart';
import 'package:iot_project/graph%20pages/Ph.dart';
import 'package:iot_project/graph%20pages/SoilMoisure.dart';
import 'package:iot_project/graph%20pages/WaterFlow.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/temprature.dart';

import '../graph pages/Temperature.dart';

class RoughPage extends StatefulWidget {
  const RoughPage({Key? key}) : super(key: key);

  @override
  State<RoughPage> createState() => _RoughPageState();
}

class _RoughPageState extends State<RoughPage> {
  var fetchGetData;
  var fetchPostData;
  List<dynamic> sharevalue = [];
  // late List dummy;
  void getHttp() async {
    try {
      var response = await Dio().get(
          'https://a789-2409-4072-618b-fcf8-9530-a1f8-eb3a-6ed0.ngrok.io/api/devices/');
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
          "http://angappanmuthu.pythonanywhere.com/api/chart",
          data: {"device_id": "001"});
      setState(() {
        fetchPostData = response.data;
        fetchPostData = fetchPostData["ph_value"];
        sharevalue = fetchPostData;
        // for (int i = 0; i < int.parse(fetchPostData.length.toString()); i++) {
        //   print(fetchPostData[i]);
        //   sharevalue.add(fetchPostData[i]);
        // }
        print("share value is : $sharevalue");
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getHttp();
    postHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Rough Page"),
      ),
      body: Center(
        child: Container(
          height: 200,
          child: sharevalue.isEmpty
              ? CircularProgressIndicator()
              : PhGraph(
                  date: defaultDate,
                  value: sharevalue,
                ),
        ),
      ),
    );
  }
}
