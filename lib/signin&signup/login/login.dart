import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iot_project/const/const.dart';

import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration = const Duration(milliseconds: 270);

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    this.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);
    containerSize = Tween<double>(
            begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));

    return Scaffold(
      body: Stack(
        children: [
          // Decoration
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: PRIMARY_COLOR,
              ),
            ),
          ),

          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: PRIMARY_COLOR,
              ),
            ),
          ),

          // Cancel Button
          // CancelButton(
          //   isLogin: isLogin,
          //   animationDuration: animationDuration,
          //   tapEvent: isLogin
          //       ? () => null
          //       : () {
          //           setState(() {
          //             animationController.reverse();
          //             isLogin = !isLogin;
          //           });
          //         },
          // ),

          // Login Form
          LoginForm(
              isLogin: isLogin,
              animationDuration: animationDuration,
              defaultLoginSize: defaultLoginSize),

          // Register Container
          AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget? child) {
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              } else {
                return Container();
              }
            },
          ),

          // Register Form
          // RegisterForm(
          //     animationDuration: animationDuration,
          //     isLogin: isLogin,
          //     defaultLoginSize: defaultLoginSize),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      // child: Container(
      //   width: double.infinity,
      //   height: containerSize.value,
      //   decoration: BoxDecoration(
      //     color: BACKGROUND_COLOR,
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(100.0),
      //         topRight: Radius.circular(100.0)),
      //   ),
      //   alignment: Alignment.center,
      //   child: GestureDetector(
      //     onTap: !isLogin
      //         ? null
      //         : () {
      //       animationController.forward();
      //       setState(() {
      //         isLogin = !isLogin;
      //       });
      //     },
      //     child: isLogin
      //         ? Text(
      //       "Don't have an account ? Sign Up",
      //       style: TextStyle(color: PRIMARY_COLOR, fontSize: 18.0),
      //     )
      //         : null,
      //   ),
      // ),
    );
  }
}

// class CancelButton extends StatelessWidget {
//   const CancelButton({
//     Key? key,
//     required this.isLogin,
//     required this.animationDuration,
//     required this.tapEvent,
//   }) : super(key: key);
//
//   final bool isLogin;
//   final Duration animationDuration;
//   final GestureTapCallback tapEvent;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return AnimatedOpacity(
//       opacity: isLogin ? 0.0 : 1.0,
//       duration: animationDuration,
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Container(
//           alignment: Alignment.bottomCenter,
//           width: size.width,
//           height: size.height * 0.1,
//           child: IconButton(
//             onPressed: tapEvent,
//             icon: const Icon(
//               Icons.close,
//             ),
//             color: PRIMARY_COLOR,
//           ),
//         ),
//       ),
//     );
//   }
// }
