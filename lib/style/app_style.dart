import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color(0xFFe2e2ff);
  static Color mainColor = Color(0xFF000633);
  static Color accentColor = Color(0x0ff006ff);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade200,
    Colors.pink.shade200,
    Colors.orange.shade200,
    Colors.yellow.shade200,
    Colors.green.shade200,
    Colors.blue.shade200,
    Colors.blueGrey.shade200,
    Colors.deepPurple.shade200,
    Colors.teal.shade200,
    Colors.indigo.shade200,
    Colors.purple.shade200,
    Colors.lightBlue.shade200,
    Colors.amber.shade200,
    Colors.lime.shade200,
    Colors.cyan.shade200,
    Colors.deepOrange.shade200,
    Colors.brown.shade200,
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 20.0, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 18.0, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 15.0, fontWeight: FontWeight.w500);
}
