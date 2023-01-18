import 'package:dating/utils/constant.dart';
import 'package:flukit_icons/flukit_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibration/vibration.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColorWithOpacity,
      body: SingleChildScrollView(
        child: Padding(
          padding: paddingDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .04,
              ),
              GestureDetector(
                onTap: () {
                  Vibration.vibrate(duration: 30, amplitude: 30);
                  /*  Get.offAll(
                      () => BottomBar(
                            id_client: widget.id_client,
                          ),
                      transition: Transition.leftToRight,
                      duration: Duration(milliseconds: 500)); */
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .17,
                  height: MediaQuery.of(context).size.height * .08,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 254, 254, 255),
                      /* boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF2dce89).withOpacity(.1),
                            spreadRadius: 3,
                            blurRadius: 12,
                            offset: Offset(3, 3))
                      ], */
                      border: Border.all(
                          width: 2,
                          color: Color.fromARGB(193, 255, 255, 255)
                              .withOpacity(.2)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      )),
                  child: FluIcon(
                    FluIcons.arrowLeft,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: height * .04,
              ),
              Text(
                "Find Your Love💓 ",
                style: GoogleFonts.poppins(
                    fontSize: sizeTitle, fontWeight: FontWeight.w700),
              ),
              Text(
                "Everywhere you are",
                style: GoogleFonts.poppins(
                    fontSize: sizeDefault, color: Colors.grey),
              ),
              SizedBox(
                height: height * .04,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: primaryColor.withOpacity(.1),
                          spreadRadius: 3,
                          blurRadius: 12,
                          offset: const Offset(3, 3))
                    ],
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    )),
                child: TextField(
                  keyboardType: TextInputType.number,
                  // controller: _username,

                  onChanged: ((value) {
                    // username = value;
                  }),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 218, 218, 231)
                          .withOpacity(.2),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                            width: 15,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: FluIcon(
                              FluIcons.call,
                              // color: Color.fromARGB(255, 54, 54, 54),
                              color: primaryColor,
                              style: FluIconStyles.bulk,
                            )),
                      ),
                      hintText: "Phone number",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide.none)),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: primaryColor.withOpacity(.1),
                          spreadRadius: 3,
                          blurRadius: 12,
                          offset: const Offset(3, 3))
                    ],
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    )),
                child: TextField(
                  keyboardType: TextInputType.none,
                  // controller: _username,

                  onChanged: ((value) {
                    // username = value;
                  }),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 218, 218, 231)
                          .withOpacity(.2),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                            width: 15,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: FluIcon(
                              FluIcons.lock,
                              // color: Color.fromARGB(255, 54, 54, 54),
                              color: primaryColor,
                              style: FluIconStyles.bulk,
                            )),
                      ),
                      hintText: "Password",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide.none)),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Vibration.vibrate(amplitude: 30, duration: 30);
                    },
                    child: Text(
                      'Forget password ?',
                      style: GoogleFonts.poppins(
                          fontSize: sizeDefault, color: primaryColor),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Vibration.vibrate(amplitude: 30, duration: 30);
                },
                child: Container(
                  width: double.infinity,
                  height: height * .08,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: sizeDefault,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: width * .15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("You don't have an account ?",
                        style: GoogleFonts.poppins(
                            fontSize: sizeDefault, color: Colors.grey)),
                    TextButton(
                        onPressed: () {
                          Vibration.vibrate(amplitude: 30, duration: 30);
                        },
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                              fontSize: sizeDefault, color: primaryColor),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: height * .2,
              ),
              // Spacer(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("Login with",
                        style: GoogleFonts.poppins(
                            fontSize: sizeDefault, color: Colors.grey)),
                    GestureDetector(
                      onTap: () {
                        Vibration.vibrate(amplitude: 30, duration: 30);
                      },
                      child: Container(
                        width: double.infinity,
                        height: height * .08,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FluIcon(
                              FluIcons.google,
                              style: FluIconStyles.broken,
                              color: Colors.blue,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Login with Google",
                                style: GoogleFonts.poppins(
                                    fontSize: sizeDefault,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
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
      ),
    );
  }
}
