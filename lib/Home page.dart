import 'package:iot_project/Device%20Pages/Device%20Screen.dart';
import 'package:iot_project/sensor%20pages/sensor%20screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrosAx,
              children: [
                Column(
                  children: [
                    Text(
                      "Home Page",
                      style: GoogleFonts.anton().copyWith(fontSize: 50),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    CustomButton(
                        icon: Icons.sensors_sharp,
                        data: "Sensor Report",
                        color: Colors.blue,
                        action: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SensorScreen()));
                        }),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                        icon: Icons.perm_device_information_sharp,
                        data: "Device Report",
                        color: Colors.deepOrange,
                        action: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DeviceScreen()));
                          DeviceScreen();
                        }),
                  ],
                ),
                // const SizedBox(
                //   height: 50,
                // ),
                ToggleSwitch(
                  minWidth: 90.0,
                  minHeight: 50,
                  cornerRadius: 20.0,
                  activeBgColors: const [
                    [Colors.green],
                    [Colors.red]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey[400],
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: const ['Motor on', 'Motor off'],
                  customTextStyles: const [
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
                  ],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell CustomButton(
      {color, icon, data, required GestureTapCallback action}) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: action,
      child: Ink(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(70),
                  )),
              child: Center(
                child: Text(
                  data,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                icon,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
