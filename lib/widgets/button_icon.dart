import 'package:flukit_icons/flukit_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TiIconButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final FluIcon icon;
  final String text;
  final Color textColor;
  final void Function()? onPress;
  const TiIconButton(
      {super.key,
      required this.width,
      required this.height,
      required this.icon,
      required this.color,
      required this.text,
      required this.textColor,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          width: width,
          height: height,
          color: color,
          child: Padding(
            padding: EdgeInsets.only(left: width * .1),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    margin: EdgeInsets.only(right: width * .05), child: icon),
                Text(
                  text,
                  style: GoogleFonts.poppins(fontSize: 18, color: textColor),
                ),
                SizedBox(),
              ],
            ),
          ),
        ));
  }
}
