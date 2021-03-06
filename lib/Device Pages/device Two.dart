import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_project/sensor%20pages/WaterFlow%20Pages/device%20Three.dart';

import '../sensor pages/Humidity Pages/device Two.dart';
import '../sensor pages/Ph sensor pages/device Two.dart';
import '../sensor pages/soil moisture pages/device Two.dart';
import '../sensor pages/temperature pages/device Two.dart';

class miniTwo extends StatefulWidget {
  const miniTwo({Key? key}) : super(key: key);

  @override
  State<miniTwo> createState() => _miniTwoState();
}

class _miniTwoState extends State<miniTwo> {
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
                    "Device 2",
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
                      ? SubTempTwo(deviceId: "Device_2", sensor: "temperature")
                      : dropdownvalue == "Humidity"
                          ? SubHumidityTwo(
                              deviceId: "Device_2", sensor: "humidity")
                          : dropdownvalue == "Soil Moisture"
                              ? SubSoilTwo(
                                  deviceId: "Device_2", sensor: "soil_moisture")
                              : dropdownvalue == "Ph Sensor"
                                  ? SubPhTwo(
                                      deviceId: "Device_2", sensor: "ph_value")
                                  : SubWaterThree(
                                      deviceId: "Device_2",
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
