import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  void loadSplash() async {
    Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/login');
    });
  }
  
  @override
  void initState() {
    super.initState();
    loadSplash();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.cyanAccent,
          size: 60,
        ),
      ),
    );
  }
}
