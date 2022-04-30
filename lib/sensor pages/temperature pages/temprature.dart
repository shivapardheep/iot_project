import 'dart:async';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20Five.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20Four.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20Six.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20Three.dart';
import 'package:auto_reload/auto_reload.dart';

import 'device Two.dart';
import 'device one.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  var fetchGetData;

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
    // Timer.periodic(Duration(seconds: 5), (timer) {
    //   setState(() {
    //     print("i am a timer seconds...5...");
    //     // dropdownvalue = "Device_1";
    //   });
    // });
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
                    "Temperature",
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
                      ? const SubTempOne(
                          deviceId: 'Device_1',
                          sensor: 'temperature',
                        )
                      : dropdownvalue == "Device_2"
                          ? const SubTempTwo(
                              deviceId: 'Device_2',
                              sensor: 'temperature',
                            )
                          : dropdownvalue == "Device_3"
                              ? const SubTempThree(
                                  deviceId: 'Device_3',
                                  sensor: 'temperature',
                                )
                              : dropdownvalue == "Device_4"
                                  ? const SubTempFour(
                                      deviceId: 'Device_4',
                                      sensor: 'temperature',
                                    )
                                  : dropdownvalue == "Device_5"
                                      ? const SubTempFive(
                                          deviceId: 'Device_5',
                                          sensor: 'temperature',
                                        )
                                      : const SubTempSix(
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
