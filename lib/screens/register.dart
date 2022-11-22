// ignore_for_file: avoid_print

import 'dart:async';

import 'package:dating/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String verify = "";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var phonef = "";
  late String _dropdownValueTypeUser, username, password;
  late bool showprogress;

  @override
  void initState() {
    showprogress = false;
    Firebase.initializeApp().whenComplete(() => {print("Complete!")});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late double screenWidth = MediaQuery.of(context).size.width;
    late double screenHeigth = MediaQuery.of(context).size.height;

    // Firebase.initializeApp();
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Lottie.asset("assets/img/date1.json"),
              ),
              Text(
                "Please\nEnter your\nPhone number",
                style: GoogleFonts.poppins(
                    fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              IntlPhoneField(
                initialCountryCode: 'TG',
                showDropdownIcon: false,
                flagsButtonMargin: EdgeInsets.only(
                    left: screenWidth * .05, right: screenWidth * .05),
                keyboardType: TextInputType.phone,
                onChanged: (phone) {
                  phonef = phone.completeNumber;
                  print(phone.completeNumber);
                },
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(fontFamily: "Poppins"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 233, 19, 90))),
                ),
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      showprogress = true;
                      /* Timer(const Duration(seconds: 3), () {
                         /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OtpPage())) */;
                        }) */
                    });
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '{$phonef}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        RegisterPage.verify = verificationId;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 233, 19, 90),
                    shape: const StadiumBorder(),
                  ),
                  child: showprogress
                      ? const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 237, 3, 81)),
                          ),
                        )
                      : const Text(
                          "Verify",
                          style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
