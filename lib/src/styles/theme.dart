import 'package:covidapp/src/styles/app_colors.dart';
import 'package:covidapp/src/styles/system_styles.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    primarySwatch: createMaterialColor(AppColors.lightGold),
    primaryColor: AppColors.primary,
    shadowColor: AppColors.gray,
    hintColor: AppColors.red,
    brightness: Brightness.dark,
    disabledColor: AppColors.primary.withOpacity(0.5),
    dialogBackgroundColor: AppColors.darkGold,
    cardColor: AppColors.black,
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.darkGold),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.tabLabelColor.withOpacity(0.6),
    ),
    backgroundColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    scrollbarTheme: ScrollbarThemeData(
      interactive: true,
      isAlwaysShown: true,
      radius: const Radius.circular(2.0),
      thumbColor: MaterialStateProperty.all(
        AppColors.primary,
      ),
      trackColor: MaterialStateProperty.all(
        AppColors.white,
      ),
      showTrackOnHover: true,
      thickness: MaterialStateProperty.all(6.0),
      minThumbLength: 100,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.darkGold,
      filled: true,
      errorMaxLines: 4,
      errorStyle: const TextStyle(
        letterSpacing: -0.4,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gray),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8.0),
      ),
      contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      hintStyle: const TextStyle().copyWith(
        color: AppColors.gray2,
        fontWeight: FontWeight.w600,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerColor: AppColors.gray2,
    fontFamily: 'Sofia Pro',
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemStyles.lightdarkNav,
      color: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColors.lightGold),
    ),
    textTheme: TextTheme(
      headline5: const TextStyle().copyWith(
        color: AppColors.textGold,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      headline4: const TextStyle().copyWith(
        color: AppColors.textGold,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
      headline3: const TextStyle().copyWith(
        color: AppColors.textGold,
        fontSize: 21,
        fontWeight: FontWeight.w400,
      ),
      headline2: const TextStyle().copyWith(
        color: AppColors.textGold,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryTextTheme: TextTheme(
      headline5: const TextStyle().copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      headline4: const TextStyle().copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
      headline3: const TextStyle().copyWith(
        color: AppColors.white,
        fontSize: 21,
        fontWeight: FontWeight.w400,
      ),
      headline2: const TextStyle().copyWith(
        color: AppColors.white,
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      button: const TextStyle().copyWith(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.lightGold),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.primary),
    canvasColor: AppColors.primary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.gray,
        selectedIconTheme: IconThemeData(
          color: AppColors.primary,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.gray,
        )),
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.transparent),
        checkColor: MaterialStateProperty.all(AppColors.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: AlwaysActiveBorderSide()));

ThemeData lightTheme = ThemeData(
    primarySwatch: createMaterialColor(AppColors.primary),
    primaryColor: AppColors.primary,
    shadowColor: AppColors.smoke,
    hintColor: AppColors.red,
    brightness: Brightness.light,
    dialogBackgroundColor: AppColors.lightGold,
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.rareGold),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.tabLabelColor.withOpacity(0.6),
    ),
    backgroundColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.lightGold,
    scrollbarTheme: ScrollbarThemeData(
      interactive: true,
      isAlwaysShown: true,
      radius: const Radius.circular(2.0),
      thumbColor: MaterialStateProperty.all(
        AppColors.primary,
      ),
      trackColor: MaterialStateProperty.all(
        AppColors.scrollTrack,
      ),
      showTrackOnHover: true,
      thickness: MaterialStateProperty.all(6.0),
      minThumbLength: 100,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gray2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8.0),
      ),
      contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      hintStyle: const TextStyle().copyWith(
        color: AppColors.gray2,
        fontWeight: FontWeight.w600,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerColor: AppColors.darkGold,
    fontFamily: 'Sofia Pro',
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemStyles.darkWhiteNav,
      color: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      headline5: const TextStyle().copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      headline4: const TextStyle().copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
      headline3: const TextStyle().copyWith(
        color: AppColors.primary,
        fontSize: 21,
        fontWeight: FontWeight.w400,
      ),
      headline2: const TextStyle().copyWith(
        color: AppColors.primary,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryTextTheme: TextTheme(
      headline5: const TextStyle().copyWith(
        color: AppColors.textBlack,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      headline4: const TextStyle().copyWith(
        color: AppColors.textBlack,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
      headline3: const TextStyle().copyWith(
        color: AppColors.textBlack,
        fontSize: 21,
        fontWeight: FontWeight.w400,
      ),
      headline2: const TextStyle().copyWith(
        color: AppColors.textBlack,
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      button: const TextStyle().copyWith(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    disabledColor: AppColors.primary.withOpacity(0.5),
    iconTheme: const IconThemeData(color: AppColors.lightGold),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.black),
    canvasColor: AppColors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.gray,
        selectedIconTheme: IconThemeData(
          color: AppColors.primary,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.gray,
        )),
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(AppColors.white),
        checkColor: MaterialStateProperty.all(AppColors.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: AlwaysActiveBorderSide()));

MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(states) =>
      const BorderSide(color: AppColors.primary, width: 1);
}
