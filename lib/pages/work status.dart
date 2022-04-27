import 'package:iot_project/pages/StyleScheme.dart';
import 'package:iot_project/pages/work%20status%202.dart';
import 'package:flutter/material.dart';

class WorkStatus extends StatefulWidget {
  const WorkStatus({Key? key}) : super(key: key);

  @override
  State<WorkStatus> createState() => _WorkStatusState();
}

class _WorkStatusState extends State<WorkStatus> {
  Color primarycolor = Colors.red;
  Color txtcolor = Colors.black87;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            appBarWidget(),
            const SizedBox(
              height: 10,
            ),
            searchBarWidget(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    dataWidget(
                      txtcolor: txtcolor,
                      fname: "Work Stage Order",
                      sname: "ZW001 Cutting ZA001",
                      date: "23-01-2022",
                    ),
                    dataWidget(
                      txtcolor: txtcolor,
                      fname: "Work Stage Order",
                      sname: "ZW001 Cutting ZA001",
                      date: "23-01-2022",
                    ),
                    dataWidget(
                      txtcolor: txtcolor,
                      fname: "Work Stage Order",
                      sname: "ZW001 Cutting ZA001",
                      date: "23-01-2022",
                    ),
                    dataWidget(
                      txtcolor: txtcolor,
                      fname: "Work Stage Order",
                      sname: "ZW001 Cutting ZA001",
                      date: "23-01-2022",
                    ),
                    dataWidget(
                      txtcolor: txtcolor,
                      fname: "Work Stage Order",
                      sname: "ZW001 Cutting ZA001",
                      date: "23-01-2022",
                    ),
                    dataWidget(
                      txtcolor: txtcolor,
                      fname: "Work Stage Order",
                      sname: "ZW001 Cutting ZA001",
                      date: "23-01-2022",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container dataWidget({required Color txtcolor, fname, sname, date}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      //Color(0xffF5F0F0)
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                fname,
                style: TextStyle(color: txtcolor),
                // overflow: TextOverflow.fade,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                sname,
                style: TextStyle(color: txtcolor),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: TextStyle(color: txtcolor),
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Click",
                            style: headingStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          const Icon(
                            Icons.navigate_next_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container searchBarWidget() {
    return Container(
      //Color(0xffF5F0F0)
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Search",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Icon(
              Icons.search,
              size: 30,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }

  Padding appBarWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: primarycolor,
            ),
          ),
          Text(
            "Pending Work",
            style: headingStyle.copyWith(
                color: primarycolor, fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WorkStatus2()));
            },
            child: Icon(
              Icons.home,
              color: primarycolor,
            ),
          ),
        ],
      ),
    );
  }
}
