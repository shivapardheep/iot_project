import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:iot_project/sensor%20pages/Humidity%20Pages/device%20Four.dart';
import 'package:iot_project/sensor%20pages/Humidity%20Pages/device%20Three.dart';
import 'package:iot_project/sensor%20pages/Ph%20sensor%20pages/device%20Four.dart';
import 'package:iot_project/sensor%20pages/Ph%20sensor%20pages/device%20Three.dart';
import 'package:iot_project/sensor%20pages/WaterFlow%20Pages/device%20Four.dart';
import 'package:iot_project/sensor%20pages/WaterFlow%20Pages/device%20Three.dart';
import 'package:iot_project/sensor%20pages/soil%20moisture%20pages/device%20Four.dart';
import 'package:iot_project/sensor%20pages/soil%20moisture%20pages/device%20Three.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20Four.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20Three.dart';

import '../sensor pages/Humidity Pages/device Two.dart';
import '../sensor pages/Ph sensor pages/device Two.dart';
import '../sensor pages/WaterFlow Pages/device Two.dart';
import '../sensor pages/soil moisture pages/device Two.dart';

class miniThree extends StatefulWidget {
  const miniThree({Key? key}) : super(key: key);

  @override
  State<miniThree> createState() => _miniThreeState();
}

class _miniThreeState extends State<miniThree> {
  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  String dropdownvalue = 'Temperature';

  // List of items in our dropdown menu
  var items = [
    'Temperature',
    'Humidity',
    'Soil Moisture',
    'Ph Sensor',
    'Water Flow',
  ];
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
                    "Device 4",
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
                        "Sensor",
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
                  dropdownvalue == "Temperature"
                      ? SubTempFour(deviceId: "Device_4", sensor: "temperature")
                      : dropdownvalue == "Humidity"
                          ? SubHumidityFour(
                              deviceId: "Device_4", sensor: "humidity")
                          : dropdownvalue == "Soil Moisture"
                              ? SubSoilFour(
                                  deviceId: "Device_4", sensor: "soil_moisture")
                              : dropdownvalue == "Ph Sensor"
                                  ? SubPhFour(
                                      deviceId: "Device_4", sensor: "ph_value")
                                  : SubWaterFour(
                                      deviceId: "Device_4",
                                      sensor: "temperature"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//
// 'Temperature',
// 'Humidity',
// 'Soil Moisture',
// 'Ph Sensor',
// 'Water Flow',
