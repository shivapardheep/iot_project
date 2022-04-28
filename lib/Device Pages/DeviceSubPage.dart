import 'package:iot_project/sensor%20pages/Humidity%20Pages/HumiditySubPage.dart';
import 'package:iot_project/sensor%20pages/Ph%20sensor%20pages/PhSubPage.dart';

import 'package:iot_project/sensor%20pages/soil%20moisture%20pages/SoilSubPage.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/subTemperature.dart';

import '../../graph pages/graph 2 temp.dart';

class DeviceSubPage extends StatefulWidget {
  final String id;

  const DeviceSubPage({Key? key, required this.id}) : super(key: key);
  @override
  State<DeviceSubPage> createState() => _DeviceSubPageState();
}

class _DeviceSubPageState extends State<DeviceSubPage> {
  String dropdownvalue = 'temperature';

  // List of items in our dropdown menu
  var items = [
    'temperature',
    'humidity',
    'soil_moisture',
    'ph_value',
    'water_flow',
  ];
  var _id;
  @override
  void initState() {
    super.initState();
    _id = widget.id;
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
                    _id == "Device_1"
                        ? "Device 1"
                        : _id == "Device_2"
                            ? "Device 2"
                            : "Device 3",
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
                  dropdownvalue == "temperature"
                      ? TempSubPage(deviceId: _id, sensor: "temperature")
                      : dropdownvalue == "humidity"
                          ? HumiditySubPage(deviceId: _id, sensor: "humidity")
                          : dropdownvalue == "soil_moisture"
                              ? SoilSubPage(
                                  deviceId: _id, sensor: "soil_moisture")
                              : dropdownvalue == "ph_value"
                                  ? PhSubpage(deviceId: _id, sensor: "ph_value")
                                  : TempSubPage(
                                      deviceId: _id, sensor: "temperature"),
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
