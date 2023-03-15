import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/services/auth_google.dart';
import 'package:dating/widgets/button_icon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flukit_icons/flukit_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibration/vibration.dart';

class LoginView extends StatefulWidget {
  final double width;
  final double height;
  final List<String> imagList;

  LoginView(
      {super.key,
      required this.height,
      required this.width,
      required this.imagList});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  PageController _controller = PageController();
  Timer? timer;
  late int currentPage = 0;

  increment() {
    /* _controller.nextPage(
        duration: Duration(milliseconds: 400), curve: Curves.ease); */
    /*  timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (progressIndex != 100) {
        setState(() {
          progressIndex++;
        });
      } else {
        if (currentPage == 7) {
          _controller.jumpToPage(0);
        } else {
         
        }
      }
    }); */
  }

  @override
  void initState() {
    super.initState();
    // _controller = PageController(initialPage: currentPage);
    // increment();
  
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Stack(
              children: [
                SizedBox(
                  width: widget.width,
                  height: widget.height,
                  child: PageView(
                    controller: _controller,
                    scrollDirection: Axis.vertical,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                      print(currentPage);
                    },
                    children: widget.imagList
                        .map(
                          (e) => CachedNetworkImage(
                            imageUrl: e,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),

                    /* CachedNetworkImage(
                      imageUrl:
                          'https://images.pexels.com/photos/1858175/pexels-photo-1858175.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ), */
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: widget.height * .7,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 15,
            left: 15,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Vibration.vibrate(amplitude: 30, duration: 30);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'New there ?',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        Text(
                          ' Create an account',
                          style: GoogleFonts.poppins(color: Colors.pinkAccent),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.5,
                ),
                TiIconButton(
                    width: widget.width,
                    height: widget.height * .07,
                    icon: FluIcon(
                      FluIcons.googleUnicon,
                      color: Colors.white,
                    ),
                    color: Colors.pinkAccent,
                    text: 'Login with Google',
                    textColor: Colors.white,
                    onPress: () {
                      Vibration.vibrate(amplitude: 30, duration: 30);
                      GoogleAuthService().signInWithGoogle();
                    }),
                SizedBox(
                  height: 15,
                ),
                TiIconButton(
                    width: widget.width,
                    height: widget.height * .07,
                    icon: FluIcon(
                      FluIcons.facebookFUnicon,
                      color: Colors.white,
                    ),
                    color: Color(0xff023e8a),
                    text: 'Login with Facebook',
                    textColor: Colors.white,
                    onPress: () {
                      Vibration.vibrate(amplitude: 30, duration: 30);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
