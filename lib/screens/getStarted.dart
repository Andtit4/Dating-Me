import 'package:flukit_icons/flukit_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: GetStartedPage(),
  ));
}

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  late double screenWidth = MediaQuery.of(context).size.width;
  late double screenHeigth = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeigth,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(fit: StackFit.expand, children: [
          Image.network(
            "https://cdn.pixabay.com/photo/2020/04/10/12/47/social-networks-5025657_960_720.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: screenHeigth * .2,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.white,
              Colors.transparent,
            ], begin: Alignment.bottomLeft, end: Alignment.topCenter)),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * .05),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: screenHeigth * .2,
                decoration: BoxDecoration(
                    color: Color.fromARGB(223, 255, 255, 255),
                    borderRadius: BorderRadius.circular(35)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Get and find your partner instantly👨‍❤️‍💋‍👨​",
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: Container(
                        width: double.infinity,
                        height: screenHeigth * .065,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 240, 124, 163),
                                shape: StadiumBorder()),
                            child: Padding(
                              padding: const EdgeInsets.all(9),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Get Started",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  FluIcon(
                                    FluIcons.arrowRight,
                                    color: Colors.white,
                                    style: FluIconStyles.bulk,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
          /* Container(
            width: double.infinity,
            height: screenHeigth * .2,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.white,
              Colors.transparent,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ) */
        ]),
      ),
    );
  }
}
