import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import './launch.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     return   DynamicTheme(

        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(


            fontFamily: 'Poppins',
            primaryColor: Color(0xff263238),
            brightness: brightness ==  Brightness.light
                ? Brightness.light
                : Brightness.dark,
            scaffoldBackgroundColor:brightness ==Brightness.dark ? Colors.white10 : Colors.white

    
        ),

        themedWidgetBuilder: (context,themeData) =>   MaterialApp(
          title: 'Covid19 update',
          theme: themeData,
         home: LaunchScreen(),
        ),

    );
  }
}


