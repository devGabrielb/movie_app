import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     
    //     statusBarColor: Color(0xFFFFFAFB), // status bar color
    //     statusBarIconBrightness: Brightness.dark,
    //      // status bar icons' color
        
    // ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primaryColor: Color(0XFF1f1d32),
        accentColor: Color(0XFFEF4D88),
        brightness: Brightness.light
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
