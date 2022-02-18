import 'package:barnivore/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BarnivoreTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.varelaRound(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Palette.almostBlack,
    ),
    bodyText2: GoogleFonts.varelaRound(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Palette.almostBlack,
    ),
    headline1: GoogleFonts.varelaRound(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Palette.almostBlack,
    ),
    headline2: GoogleFonts.varelaRound(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Palette.almostBlack,
    ),
    headline3: GoogleFonts.varelaRound(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Palette.almostBlack,
    ),
    headline6: GoogleFonts.varelaRound(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Palette.almostBlack,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.varelaRound(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.varelaRound(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    headline1: GoogleFonts.varelaRound(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.varelaRound(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.varelaRound(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.varelaRound(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: lightTextTheme,
      canvasColor: Colors.white,
      backgroundColor: Palette.primaryColor,
      primaryColor: Palette.primaryColor,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Palette.lightGrey,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 2.0,
        foregroundColor: Colors.white,
        backgroundColor: Palette.almostBlack,
        //System Overlay
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Palette.primaryColor,
          systemStatusBarContrastEnforced: true,
          statusBarBrightness: Brightness.light,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Palette.primaryColor,
        unselectedLabelColor: Palette.primaryColor.withAlpha(80),
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        indicator: const UnderlineTabIndicator(borderSide: BorderSide(color: Palette.primaryColor, width: 2.0)),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Palette.primaryColor.withAlpha(80),
        selectedItemColor: Palette.primaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Palette.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2.0,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0), //const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          primary: Palette.primaryColor.withOpacity(0.9),
          textStyle: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Palette.primaryColor,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        //contentPadding: EdgeInsets.all(12.0),
        //labelStyle: TextStyle(color: Palette.labelGrey),
        //floatingLabelStyle: TextStyle(color: Palette.labelGrey),

        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Palette.primaryColor,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(
          Colors.white,
        ),
        trackColor: MaterialStateProperty.all(
          Palette.primaryMaterialColor.shade500,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Palette.primaryColor.withAlpha(100)),
    );
  }

  static ThemeData datePickerLight() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.light,
        primary: Palette.primaryColor,
        secondary: Palette.almostBlack,
        surface: Palette.primaryColor,
      ),
    );
  }

  static ThemeData timePickerLight() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.light,
        primary: Palette.primaryColor,
        onPrimary: Colors.white,
        surface: Colors.white,
        onSurface: Palette.almostBlack,
        onBackground: Palette.labelGrey, //Palette.primaryColor.withAlpha(10),
      ),
      timePickerTheme: const TimePickerThemeData(
        entryModeIconColor: Palette.primaryColor,
        //dialTextColor: Palette.primaryColor,
        //dialHandColor: Colors.blue,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: darkTextTheme,
      canvasColor: Colors.black,
      primaryColor: Palette.primaryColor,
      backgroundColor: Palette.primaryColor,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Palette.almostBlack,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 2.0,
        foregroundColor: Colors.white,
        backgroundColor: Palette.almostBlack,
        //System Overlay
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Palette.almostBlack,
          systemStatusBarContrastEnforced: false,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Palette.primaryColor,
        unselectedLabelColor: Palette.primaryColor.withAlpha(120),
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        indicator: const UnderlineTabIndicator(borderSide: BorderSide(color: Palette.primaryColor, width: 2.0)),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Palette.almostBlack,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Palette.almostBlack,
        selectedItemColor: Palette.primaryColor,
        unselectedItemColor: Palette.primaryColor.withAlpha(120),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Palette.primaryColor,
        foregroundColor: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2.0,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0), //const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          primary: Palette.primaryColor.withAlpha(400),
          textStyle: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Palette.primaryColor,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelStyle: TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        alignLabelWithHint: true,
        hintStyle: TextStyle(color: Colors.red),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Palette.primaryColor),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Palette.primaryColor,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(
          Palette.primaryColor,
        ),
        trackColor: MaterialStateProperty.all(
          Palette.primaryColor,
        ),
      ),
      //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueGrey.shade600, brightness: Brightness.dark),
    );
  }

  static ThemeData datePickerDark() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.dark,
        primary: Palette.primaryColor,
        surface: Palette.primaryColor,
        onSurface: Colors.white,
      ),
      dialogBackgroundColor: Palette.almostBlack,
    );
  }

  static ThemeData timePickerDark() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.dark,
        primary: Palette.primaryColor,
        surface: Palette.primaryColor,
        onSurface: Colors.white,
      ),
      timePickerTheme: TimePickerThemeData(
        entryModeIconColor: Palette.primaryColor,
        backgroundColor: Palette.almostBlack,
        dialBackgroundColor: Palette.primaryColor.withOpacity(0.1),
        hourMinuteTextStyle: const TextStyle(color: Palette.primaryColor, fontSize: 48),
        hourMinuteColor: Palette.primaryColor.withOpacity(0.1),
        dialHandColor: Palette.primaryColor,
      ),
    );
  }
}
