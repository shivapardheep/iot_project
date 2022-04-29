import 'package:iot_project/sensor%20pages/Humidity%20Pages/device%20one.dart';
import 'package:iot_project/sensor%20pages/Ph%20sensor%20pages/device%20one.dart';
import 'package:iot_project/sensor%20pages/WaterFlow%20Pages/device%20one.dart';
import 'package:iot_project/sensor%20pages/soil%20moisture%20pages/device%20one.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/device%20one.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class minione extends StatefulWidget {
  const minione({Key? key}) : super(key: key);

  @override
  State<minione> createState() => _minioneState();
}

class _minioneState extends State<minione> {
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
                    "Device 1",
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
                      ? SubTempOne(deviceId: "Device_1", sensor: "temperature")
                      : dropdownvalue == "Humidity"
                          ? SubHumidityOne(
                              deviceId: 'Device_1',
                              sensor: 'humidity',
                            )
                          : dropdownvalue == "Soil Moisture"
                              ? SubSoilOne(
                                  deviceId: "Device_1", sensor: "soil_moisture")
                              : dropdownvalue == "Ph Sensor"
                                  ? SubPhOne(
                                      deviceId: "Device_1", sensor: "ph_value")
                                  : SubWaterOne(
                                      deviceId: "Device_1",
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
