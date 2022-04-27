import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Home page.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input.dart';
import '../../../components/rounded_password_input.dart';
import '../../../pages/Order page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 5,
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: defaultLoginSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.asset('assets/images/login.svg'),
                RoundedInput(
                  icon: Icons.mobile_screen_share_outlined,
                  hint: "Mobile",
                ),
                RoundedPasswordInput(
                  hint: "Password",
                ),
                RoundedButton(
                  title: "LOGIN",
                  action: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
