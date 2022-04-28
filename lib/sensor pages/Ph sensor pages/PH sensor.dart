import 'package:dio/dio.dart';
import 'package:iot_project/sensor%20pages/Humidity%20Pages/HumiditySubPage.dart';
import 'package:iot_project/sensor%20pages/Ph%20sensor%20pages/PhSubPage.dart';
import 'package:iot_project/sensor%20pages/soil%20moisture%20pages/SoilSubPage.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20Three.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20Two.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20one.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/subTemperature.dart';

import '../../graph pages/graph 2 temp.dart';

class PhPage extends StatefulWidget {
  const PhPage({Key? key}) : super(key: key);

  @override
  State<PhPage> createState() => _PhPageState();
}

class _PhPageState extends State<PhPage> {
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
                    "Ph sensor",
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
                      ? PhSubpage(
                          deviceId: 'Device_1',
                          sensor: 'ph_value',
                        )
                      : dropdownvalue == "Device_2"
                          ? PhSubpage(
                              deviceId: 'Device_2',
                              sensor: 'ph_value',
                            )
                          : PhSubpage(
                              deviceId: 'Device_3',
                              sensor: 'ph_value',
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
