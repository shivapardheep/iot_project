import 'package:dio/dio.dart';

import 'package:iot_project/sensor%20pages/WaterFlow%20Pages/device%20Five.dart';
import 'package:iot_project/sensor%20pages/WaterFlow%20Pages/device%20Three.dart';
import 'package:iot_project/sensor%20pages/WaterFlow%20Pages/device%20Two.dart';
import 'package:iot_project/sensor%20pages/WaterFlow%20Pages/device%20one.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'device Four.dart';
import 'device Six.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
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
    'Device_4',
    'Device_5',
    'Device_6'
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
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Water Flow",
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
                      ? SubWaterOne(
                          deviceId: 'Device_1',
                          sensor: 'temperature',
                        )
                      : dropdownvalue == "Device_2"
                          ? SubWaterTwo(
                              deviceId: 'Device_2',
                              sensor: 'temperature',
                            )
                          : dropdownvalue == "Device_3"
                              ? SubWaterThree(
                                  deviceId: 'Device_3',
                                  sensor: 'temperature',
                                )
                              : dropdownvalue == "Device_4"
                                  ? SubWaterFour(
                                      deviceId: 'Device_4',
                                      sensor: 'temperature',
                                    )
                                  : dropdownvalue == "Device_5"
                                      ? SubWaterFive(
                                          deviceId: 'Device_5',
                                          sensor: 'temperature',
                                        )
                                      : SubWaterSix(
                                          deviceId: 'Device_6',
                                          sensor: 'temperature',
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
