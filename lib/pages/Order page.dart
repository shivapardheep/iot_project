import 'package:iot_project/pages/TrackOrderPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My orders",
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              color: Colors.grey[700]),
                        ),
                        Text(
                          "Start new",
                          style: GoogleFonts.cabin(
                              fontWeight: FontWeight.w600,
                              // fontSize: 30,
                              color: Colors.blue[400]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "${'\$1,234'}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              "Total puchase",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "110",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              "Total sold",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              "Active",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    endIndent: 10,
                    indent: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Text(
                      "RECENT ORDERS",
                      style: TextStyle(
                          letterSpacing: 3,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ),
                  OrderData(
                      image: "assets/dress1.jpg",
                      name: "Napa is Home",
                      date: "Feb 9, 2022",
                      color: Colors.green,
                      deal: "Active"), //firstData
                  OrderData(
                      image: "assets/dress2.jpg",
                      name: "Santa Rosa ",
                      date: "Feb 1, 2022",
                      color: Colors.red,
                      deal: "Draft"), //firstData
                  OrderData(
                      image: "assets/dress3.jpg",
                      name: "The Fanlasy",
                      date: "jan 1, 2022",
                      color: Colors.red,
                      deal: "Ended"), //firstData
                  OrderData(
                      image: "assets/dress1.jpg",
                      name: "Napa is Home",
                      date: "Feb 9, 2022",
                      color: Colors.green,
                      deal: "Active"), //firstData
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 36,
                          width: 80,
                          // alignment: Alignment.bottomRight,
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "SEE ALL",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding OrderData({image, name, date, color, deal}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => TrackOrderPage()));
        },
        child: Ink(
          height: 70,
          width: double.infinity,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          // color: Colors.blue,
                          image: DecorationImage(
                              image: AssetImage("$image"), fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.lightBlue[800],
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          date,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          deal,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "9 days left",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.settings,
                    color: Colors.grey[600],
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
