import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_project/sensor%20pages/soil%20moisture%20pages/soil%20moisture.dart';
import 'package:iot_project/sensor%20pages/temperature%20pages/temprature.dart';

import 'Humidity Pages/Humidity.dart';
import 'Ph sensor pages/PH sensor.dart';
import 'WaterFlow Pages/WaterFlow.dart';

class SensorScreen extends StatefulWidget {
  const SensorScreen({Key? key}) : super(key: key);

  @override
  State<SensorScreen> createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sensors ",
                      style: GoogleFonts.anton().copyWith(fontSize: 50),
                    ),
                    containerButton(
                        icon: FontAwesomeIcons.temperature2,
                        data: "Temperature",
                        action: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Temprature()));
                        }),
                    containerButton(
                      icon: FontAwesomeIcons.droplet,
                      data: "Humidity",
                      action: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HumidityPage()));
                      },
                    ),
                    containerButton(
                      icon: FontAwesomeIcons.waterLadder,
                      data: "Soil Moisture",
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SoilMoisturePage()));
                      },
                    ),
                    containerButton(
                      icon: FontAwesomeIcons.vial,
                      data: "Ph Sensor",
                      action: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => PhSensorPages()));
                      },
                    ),
                    containerButton(
                      icon: FontAwesomeIcons.water,
                      data: "Water Flow",
                      action: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => WaterFlow()));
                      },
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Padding containerButton({icon, data, required GestureTapCallback action}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: action,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.lightBlue,
                  Colors.blue,
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      data,
                      style: GoogleFonts.bebasNeue()
                          .copyWith(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
