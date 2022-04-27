import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../graph pages/graph 2 temp.dart';

class WThree extends StatefulWidget {
  const WThree({Key? key}) : super(key: key);

  @override
  State<WThree> createState() => _WThreeState();
}

class _WThreeState extends State<WThree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Graphwidget(context, date: "Today 27/04/2022"),
        const SizedBox(
          height: 30,
        ),
        Graphwidget(context, date: "Yesterday 26/04/2022"),
        const SizedBox(
          height: 30,
        ),
        Graphwidget(context, date: "This week 7 days"),
      ],
    );
  }

  Column Graphwidget(BuildContext context, {date}) {
    return Column(
      children: [
        Text(
          date,
          style:
              GoogleFonts.anton().copyWith(fontSize: 20, color: Colors.white70),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 30,
            child: GraphTwo()),
      ],
    );
  }
}
