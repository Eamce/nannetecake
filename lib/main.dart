import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nannetecake/Serices/API.dart';
import 'package:nannetecake/tabscreens/menu.dart';
import 'Globals/images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nannete Cake Creations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool? isRootedDevice = false;

  @override
  void initState() {
    super.initState();
    // initPlatformStateCheckRooted();
    Timer(Duration(seconds: 5), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(
                  Images.logo,
                  width: 85,
                ),
              ),
            ),
            Container(
                child: Text("Loading please wait...",
                    style: TextStyle(color: Colors.black))),
            Container(
              width: 115,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future checkFirstSeen() async {
    if (isRootedDevice == false) {
      var con = await checkConnection(context);

      // print(con);
      if (con == 'Connected') {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()),);
      }
    } else {
      // Navigator.pushNamed(context, trustFallRoute);
    }
  }

  Future<bool> checkLogin() async{

    return true;
  }
}