import 'dart:async';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_facebook_app/screens/DetailedScreen.dart'; //important fix
import 'package:flutter/material.dart';
import 'package:login_facebook_app/screens/login.dart';
import 'package:login_facebook_app/utils/colors.dart';
import 'package:login_facebook_app/screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Titulo de la app en segundo plano
      title: 'Canchas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Raleway',
      ),
      //Se carga primero el Splash
      home: SplashPage(),
      //routes: routes,
    );
  }
}

