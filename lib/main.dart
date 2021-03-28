import 'package:flutter/material.dart';
import 'package:login_test/pages/home.dart';
import 'package:login_test/pages/login.dart';
import 'package:login_test/pages/mainmenu.dart';
import 'package:login_test/pages/monitoring_spm.dart';
import 'package:login_test/pages/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/login': (context) => Login(),
      '/main_menu': (context) => MainMenu(),
      '/home': (context) => Home(),
      '/monitoring_spm': (context) => MonitoringSpm(),
    },
  ));
}
