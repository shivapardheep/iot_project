import 'package:dio/dio.dart';
import 'package:iot_project/sensor%20pages/Humidity%20Pages/HumiditySubPage.dart';
import 'package:iot_project/sensor%20pages/soil%20moisture%20pages/SoilSubPage.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20Three.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20Two.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20one.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/subTemperature.dart';

import '../../graph pages/graph 2 temp.dart';

class SoilPage extends StatefulWidget {
  const SoilPage({Key? key}) : super(key: key);

  @override
  State<SoilPage> createState() => _SoilPageState();
}

class _SoilPageState extends State<SoilPage> {
  var fetchGetData;

  // get data
  void getHttp() async {
    try {
      var response = await Dio()
          .get('http://angappanmuthu.pythonanywhere.com/api/devices/');
      setState(() {
        fetchGetData = response.data;
        print(fetchGetData[0]['device']);
      });
      // print(response.data[2]);
    } catch (e) {
      print(e);
    }
  }

  String dropdownvalue = 'Device_1';

  // List of items in our dropdown menu
  var items = [
    'Device_1',
    'Device_2',
    'Device_3',
  ];
  @override
  void initState() {
    super.initState();
    // getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Soil Moisture",
                    style: GoogleFonts.anton()
                        .copyWith(fontSize: 50, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Device",
                        style: GoogleFonts.anton()
                            .copyWith(fontSize: 30, color: Colors.white70),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      DropdownButton(
                        dropdownColor: Colors.grey,
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: GoogleFonts.basic()
                                  .copyWith(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            print(dropdownvalue);
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  dropdownvalue == "Device_1"
                      ? SoilSubPage(
                          deviceId: 'Device_1',
                          sensor: 'soil_moisture',
                        )
                      : dropdownvalue == "Device_2"
                          ? SoilSubPage(
                              deviceId: 'Device_2',
                              sensor: 'soil_moisture',
                            )
                          : SoilSubPage(
                              deviceId: 'Device_3',
                              sensor: 'soil_moisture',
                            ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
