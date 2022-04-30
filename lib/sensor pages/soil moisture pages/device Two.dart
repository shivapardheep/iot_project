import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_project/UrlPage/urlpage.dart';
import 'package:iot_project/graph%20pages/SoilMoisure.dart';

class SubSoilTwo extends StatefulWidget {
  final String deviceId;
  final String sensor;

  const SubSoilTwo({Key? key, required this.deviceId, required this.sensor})
      : super(key: key);

  @override
  State<SubSoilTwo> createState() => _SubSoilTwoState();
}

class _SubSoilTwoState extends State<SubSoilTwo> {
  var fetchGetData;
  var fetchPostData;
  List<dynamic> sharevalue = [];

  //post to get
  void postHttp() async {
    try {
      var response = await Dio().post(sensorUrl.toString(),
          data: {"device_id": _deviceId.toString()});
      setState(() {
        fetchPostData = response.data;
        fetchPostData = fetchPostData[_sensor.toString()];
        sharevalue = fetchPostData;

        print("share value is : $sharevalue");
      });
    } catch (e) {
      print(e);
    }
  }

  var _deviceId;
  var _sensor;

  @override
  void initState() {
    super.initState();
    _deviceId = widget.deviceId;
    _sensor = widget.sensor;
    postHttp();
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
        sharevalue.isEmpty
            ? CircularProgressIndicator()
            : Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 30,
                child: SoilGraph(
                  value: sharevalue,
                  date: defaultDate,
                )),
      ],
    );
  }
}
