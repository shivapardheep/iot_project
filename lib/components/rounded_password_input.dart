import 'package:flutter/material.dart';
import 'package:iot_project/components/input_container.dart';
import 'package:iot_project/const/const.dart';

class RoundedPasswordInput extends StatefulWidget {
  const RoundedPasswordInput({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  State<RoundedPasswordInput> createState() => _RoundedPasswordInputState();
}

class _RoundedPasswordInputState extends State<RoundedPasswordInput> {
  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        cursorColor: PRIMARY_COLOR,
        obscureText: true,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: InputBorder.none,
          icon: Icon(
            Icons.lock,
          ),
        ),
      ),
    );
  }
}
