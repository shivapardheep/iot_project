import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'StyleScheme.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({Key? key}) : super(key: key);

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _size.height,
          width: _size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Center(
                          child: Text(
                            "Track Order",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ), //appbar
                  const Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            // color: Colors.green,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/onBoard2.png")),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order Id",
                              style: headingStyle,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  gradient: gradientStyle,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "10034",
                                style:
                                    headingStyle.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity",
                              style: headingStyle,
                            ),
                            Text(
                              "1",
                              style: headingStyle.copyWith(
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product name",
                              style: headingStyle,
                            ),
                            Text(
                              "Santa rosa",
                              style: headingStyle.copyWith(
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order Type",
                              style: headingStyle,
                            ),
                            Text(
                              "Gadgets",
                              style: headingStyle.copyWith(
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "payment status",
                              style: headingStyle,
                            ),
                            Text(
                              "cash",
                              style: headingStyle.copyWith(
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Amount",
                              style: headingStyle,
                            ),
                            Text(
                              "\$12,000",
                              style: headingStyle.copyWith(
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Divider(
                            thickness: 5,
                            indent: 50,
                            endIndent: 50,
                          ),
                        ),
                        //Tracking status view
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Track view",
                            style: headingStyle.copyWith(fontSize: 30),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Colors.grey),
                              height: 400,
                              width: 4,
                              margin: EdgeInsets.only(left: 9, top: 40),
                            ),
                            Column(
                              children: [
                                ballwidget(
                                  istrue: true,
                                  fdata: "Confirmed",
                                  img: "confirmed",
                                ),
                                ballwidget(
                                  istrue: false,
                                  fdata: "Pick Up",
                                  img: "onBoard2",
                                ),
                                ballwidget(
                                  istrue: false,
                                  fdata: "In Progress",
                                  img: "servicesImg",
                                ),
                                ballwidget(
                                  istrue: false,
                                  fdata: "Shipped",
                                  img: "shipped",
                                ),
                                ballwidget(
                                  istrue: false,
                                  fdata: "Delivered",
                                  img: "Delivery",
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Divider(
                            thickness: 5,
                            indent: 50,
                            endIndent: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container ballwidget({istrue, fdata, img}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 10),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: istrue ? Colors.orange : Colors.white,
              border: Border.all(
                  width: 3, color: istrue ? Colors.transparent : Colors.orange),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/$img.png"))),
              ),
              Text("$fdata"),
            ],
          ),
        ],
      ),
    );
  }
}
