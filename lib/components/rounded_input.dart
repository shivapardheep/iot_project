import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iot_project/const/const.dart';

import 'input_container.dart';

class RoundedInput extends StatefulWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.hint,
  }) : super(key: key);

  final IconData icon;
  final String hint;

  @override
  State<RoundedInput> createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InputContainer(
      child: TextField(
        cursorColor: PRIMARY_COLOR,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: InputBorder.none,
          icon: Icon(
            widget.icon,
          ),
        ),
      ),
    );
  }
}
