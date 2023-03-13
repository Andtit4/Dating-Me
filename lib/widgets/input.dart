import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TiInput extends StatelessWidget {
  final double width;
  final double height;
  final String hintText;
  late String inputValue;
  late Color inputColor;
  late TextEditingController inputController;
  final TextInputType keyboardType;
  final Icon icon;
  final Color color;
  late bool readonly = false;

  TiInput(
      {super.key,
      required this.color,
      required this.hintText,
      required this.height,
      required this.icon,
      required this.inputColor,
      // required this.inputValue,
      required this.inputController,
      required this.keyboardType,
      required this.readonly,
      required this.width});

  @override
  Widget build(BuildContext context) {
    /*  late double height = MediaQuery.of(context).size.height;
    late double width = MediaQuery.of(context).size.width; */
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
            width: .1,
            color:
                inputColor), /* borderRadius: const BorderRadius.all(Radius.circular(25)) */
      ),
      child: TextField(
        readOnly: readonly,
        keyboardType: keyboardType,
        controller: inputController,
        // controller: _username,

        onChanged: ((value) {
          inputValue = value;
          print("Saisie__$inputValue")

              // username = value;
              /*  telephone_enter = value;
                    print("[+] Saisie : $telephone_enter") */
              ;
        }),
        decoration: InputDecoration(
            filled: true,
            fillColor: color,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  width: 15,
                  height: double.infinity,
                  /*  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)), */
                  child: icon),
            ),
            // prefixIconColor: const Color.fromARGB(255, 248, 200, 24),
            // contentPadding: EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(fontSize: 16),
            enabledBorder: const OutlineInputBorder(
              /* borderRadius: BorderRadius.all(Radius.circular(25)), */
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
