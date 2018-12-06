import 'package:flutter/material.dart';
import 'package:login_facebook_app/screens/option_session.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      //Duracion del Splash
        seconds: 5,
        //Cambio de Vista
        navigateAfterSeconds: new OptionSessionPage(),
        title: new Text('Bienvenido a la App de Pichangas',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: Image.asset('assets/logo_login.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        //Color de la Carga del Splash
        loaderColor: Colors.green
    );
  }
}
