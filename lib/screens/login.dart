import 'dart:ui';

import 'package:dating/widgets/input.dart';
import 'package:dating/widgets/text.dart';
import 'package:dating/widgets/textBold.dart';
import 'package:flukit_icons/flukit_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  late bool showItems = false;
  late TextEditingController email = new TextEditingController();
  late TextEditingController pass = new TextEditingController();

  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  )
    ..forward()
    ..addListener(() {
      if (_controller.isCompleted) {
        _controller.stop();
      }
    });

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  Positioned(
                    bottom: height * .06,
                    left: 10,
                    // alignment: Alignment.bottomLeft,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: GestureDetector(
                          onTap: () {
                            Vibration.vibrate(amplitude: 30, duration: 30);
                            setState(() {
                              showItems = !showItems;
                            });
                          },
                          child: Container(
                            width: width * .2,
                            height: height * .08,
                            color: Color.fromARGB(179, 224, 224, 224),
                            child: FluIcon(FluIcons.login),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: height * .07,
                      left: width * .05,
                      right: width * .05,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TiTextBold(
                              fontSize: 27,
                              text: 'Welcome back\nlogin before continue',
                              color: Colors.black),
                          TiText(
                            text: 'Find your love everywhere you are😘',
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          Container(
                            width: width * .3,
                            height: 2,
                            margin: EdgeInsets.only(top: 10),
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: height * .05,
                          ),
                          Container(
                            child: TiInput(
                                color: Colors.white,
                                inputColor: Colors.black,
                                hintText: 'Adresse courrielle',
                                height: height * .08,
                                icon: Icon(Icons.person),
                                inputController: email,
                                keyboardType: TextInputType.emailAddress,
                                readonly: false,
                                width: width),
                          ),
                          SizedBox(
                            height: height * .025,
                          ),
                          Container(
                            child: TiInput(
                                color: Colors.white,
                                inputColor: Colors.black,
                                hintText: 'Mot de passe',
                                height: height * .08,
                                icon: Icon(Icons.lock),
                                inputController: pass,
                                keyboardType: TextInputType.emailAddress,
                                readonly: false,
                                width: width),
                          ),
/*                           SizedBox(
                            height: height * .015,
                          ), */
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                Vibration.vibrate(amplitude: 30, duration: 30);
                              },
                              child: TiText(
                                  fontSize: 16,
                                  text: 'Mot de passe oublié ?',
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )),
                  Positioned(
                    bottom: height * .16,
                    left: 10,
                    // alignment: Alignment.bottomLeft,
                    child: showItems == true
                        ? Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Vibration.vibrate(
                                      amplitude: 30, duration: 30);
                                },
                                child: Container(
                                  width: width * .2,
                                  height: height * .08,
                                  margin: EdgeInsets.only(top: 10),
                                  color: Color.fromARGB(179, 224, 224, 224),
                                  child: FluIcon(
                                    FluIcons.google,
                                    color: Color.fromARGB(255, 224, 42, 28),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Vibration.vibrate(
                                      amplitude: 30, duration: 30);
                                },
                                child: Container(
                                  width: width * .2,
                                  height: height * .08,
                                  margin: EdgeInsets.only(top: 10),
                                  color: Color.fromARGB(179, 224, 224, 224),
                                  child: FluIcon(
                                    FluIcons.facebook,
                                    color: Color.fromARGB(255, 19, 112, 189),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
