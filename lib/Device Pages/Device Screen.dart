import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iot_project/Device%20Pages/DeviceSubPage.dart';
import 'package:iot_project/Device%20Pages/device%20Three.dart';
import 'package:iot_project/Device%20Pages/device%20Two.dart';
import 'package:iot_project/Device%20Pages/device%20one.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
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
                      "Devices ",
                      style: GoogleFonts.anton().copyWith(fontSize: 50),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    containerButton(
                        icon: FontAwesomeIcons.diceOne,
                        data: "Device 1",
                        action: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      DeviceSubPage(id: "Device_1")));
                        }),
                    containerButton(
                      icon: FontAwesomeIcons.diceTwo,
                      data: "Device 2",
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DeviceSubPage(id: "Device_2")));
                      },
                    ),
                    containerButton(
                      icon: FontAwesomeIcons.diceThree,
                      data: "Device 3",
                      action: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DeviceSubPage(id: "Device_3")));
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
                  Colors.deepOrangeAccent,
                  Colors.red,
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
