import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/services/send_whatsapp.dart';
import 'package:dating/widgets/textBold.dart';
import 'package:flukit_icons/flukit_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:story_view/story_view.dart';
import 'package:vibration/vibration.dart';

class TiStory extends StatefulWidget {
  // final List<String> img;
  late List<String> img;
  late String nameForUser;
  late String gender;
  late String userAge;
  late double width;
  late double height;
  late String description;

  TiStory(
      {super.key,
      required this.img,
      required this.width,
      required this.nameForUser,
      required this.userAge,
      required this.gender,
      required this.description,
      required this.height});

  @override
  State<TiStory> createState() => _TiStoryState();
}

class _TiStoryState extends State<TiStory> {
  late bool pressed = false;
  late bool pressed1 = false;
  late bool pressed2 = false;
  double progressIndex = 0;
  Timer? timer;
  late int currentPage = 0;
  PageController _controller = PageController();
  late bool showHome = false;

  increment() {
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (progressIndex != 100) {
        setState(() {
          progressIndex++;
        });
      } else {
        if (currentPage == 7) {
          _controller.jumpToPage(0);
        } else {
          _controller.nextPage(
              duration: Duration(milliseconds: 400), curve: Curves.ease);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    increment();
    _controller = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                // scrollBehavior: ScrollBehavior,
                onPageChanged: (index) {
                  setState(() {
                    progressIndex = 0;
                    currentPage = index;
                  });
                },
                controller: _controller,
                children: widget.img
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
                    .toList()),
          ),
          SizedBox(
            width: widget.width,
            height: widget.height * .15,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Positioned(
                  top: widget.height * .08,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRect(
                              child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Vibration.vibrate(
                                          amplitude: 30, duration: 30);
                                      setState(() {
                                        showHome = !showHome;
                                      });
                                      print(showHome);
                                    },
                                    child: Container(
                                      width: widget.width * .15,
                                      height: widget.height * .06,
                                      margin: EdgeInsets.only(
                                          top: widget.height * .01),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              61, 255, 255, 255)),
                                      child: FluIcon(FluIcons.home,
                                          color: Colors.white),
                                    ),
                                  ))),
                          showHome == true
                              ? AnimatedContainer(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.easeIn,
                                  width: widget.width * .2,
                                  height: widget.height * .06,
                                  margin:
                                      EdgeInsets.only(top: widget.height * .01),
                                  color: Color.fromARGB(61, 255, 255, 255),
                                  child: Center(
                                    child: Text(
                                      'Home',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: widget.height * .03,
                          ),
                          TiTextBold(
                              fontSize: 26,
                              text: 'Only for You',
                              color: Colors.white),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            width: widget.width * .2,
                            height: 1,
                            color: Colors.purpleAccent,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          Positioned(
              right: 15,
              bottom: widget.height * .44,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: widget.width * .15,
                    height: widget.height * .27,
                    decoration:
                        BoxDecoration(color: Color.fromARGB(61, 255, 255, 255)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        IconButton(
                          onPressed: () {
                            Vibration.vibrate(amplitude: 30, duration: 30);
                            setState(() {
                              pressed = true;
                              pressed1 = false;
                              pressed2 = false;
                            });
                            SendToWhatsapp().launchWhatsApp(22898418900,
                                'Je suis John Doe, et je veux faire plus connaissance avec toi');
                          },
                          icon: FluIcon(
                            FluIcons.whatsapp,
                            color: pressed
                                ? Colors.green
                                : Color.fromARGB(192, 255, 255, 255),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 20,
                          height: 1,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        IconButton(
                          onPressed: () {
                            Vibration.vibrate(amplitude: 30, duration: 30);
                            setState(() {
                              pressed = false;
                              pressed1 = true;
                              pressed2 = false;
                            });
                            SendToWhatsapp().textMe(22898418900,
                                'Je suis John Doe, et je veux faire plus connaissance avec toi');
                          },
                          icon: FluIcon(
                            FluIcons.smsEdit,
                            color: pressed1
                                ? Colors.purple
                                : Color.fromARGB(192, 255, 255, 255),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 20,
                          height: 1,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        IconButton(
                          onPressed: () {
                            Vibration.vibrate(amplitude: 30, duration: 30);
                            setState(() {
                              pressed = false;
                              pressed1 = false;
                              pressed2 = true;
                            });
                          },
                          icon: FluIcon(
                            FluIcons.heart,
                            color: pressed2
                                ? Colors.pink
                                : Color.fromARGB(192, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
              bottom: widget.height * .05,
              left: 0,
              right: 0,
              // height: 10,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                        width: widget.width,
                        height: widget.height * .2,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(61, 255, 255,
                              255), /* borderRadius: BorderRadius.circular(25) */
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      FluIcon(FluIcons.woman,
                                          color: Colors.white),
                                      Text(
                                        widget.nameForUser,
                                        style: GoogleFonts.poppins(
                                            fontSize: 24, color: Colors.white),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(widget.userAge,
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text('💕',
                                            style: GoogleFonts.poppins(
                                              fontSize: 20,
                                            )),
                                      ),
                                      Text(widget.gender,
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              color: Colors.white)),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  widget.description,
                                  style: GoogleFonts.poppins(
                                      color:
                                          Color.fromARGB(255, 204, 203, 203)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Vibration.vibrate(
                                        amplitude: 30, duration: 30);
                                  },
                                  child: Container(
                                    width: widget.width * .22,
                                    height: widget.height * .05,
                                    decoration:
                                        BoxDecoration(color: Colors.pink),
                                    child: Center(
                                        child: Text(
                                      'Match',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: BarProgress(
                percentage: progressIndex,
                backColor: Color.fromARGB(118, 255, 255, 255),
                showPercentage: false,
                color: Colors.white,
                stroke: 3),
          )
        ],
      ),
    );
  }
}
