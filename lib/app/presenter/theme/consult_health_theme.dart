import 'package:consult_health/app/presenter/theme/colors/consult_health_colors.dart';
import 'package:flutter/material.dart';

ConsultHealthTheme uomTheme = ConsultHealthTheme();

class ConsultHealthTheme with ChangeNotifier {

  static ThemeData get lightTheme => ThemeData(
    fontFamily: "OpenSans",
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: TextStyle(fontSize: 48, fontWeight: FontWeight.w400, letterSpacing:  0.0),
      headline4: TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing:  0.25),
      headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, letterSpacing:  0.0),
      headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing:  0.15),
      subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing:  0.15),
      subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing:  0.1),
      bodyText1: TextStyle( fontSize: 16, fontWeight: FontWeight.w400, letterSpacing:  0.5),
      bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing:  0.25),
      button:    TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500, letterSpacing:  1.25),
      caption:   TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing:  0.4),
      overline:  TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing:  1.5),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    fontFamily: "OpenSans",
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 96, color: Colors.white, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing:  0.0),
      headline4: TextStyle(fontSize: 34, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing:  0.25),
      headline5: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing:  0.0),
      headline6: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500, letterSpacing:  0.15),
      subtitle1: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing:  0.15),
      subtitle2: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500, letterSpacing:  0.1),
      bodyText1: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing:  0.5),
      bodyText2: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing:  0.25),
      button:    TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500, letterSpacing:  1.25),
      caption:   TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing:  0.4),
      overline:  TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w400, letterSpacing:  1.5),
    ),
  );
}
