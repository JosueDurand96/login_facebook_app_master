import 'package:flutter/material.dart';
import 'package:login_facebook_app/screens/menu.dart';
import 'package:login_facebook_app/screens/option_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String status = "";
  @override
  void initState() {
    super.initState();
    getStatusSharedPreferences();
  }

  getStatusSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      status = prefs.getString('token') ?? "";
    });
  }

  getPage() {
    if (status.length == 0) {
      print("value localstore"+status);
      return new OptionSessionPage();
    } else {
      return new Menu();
    }
  }
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      //Duracion del Splash
        seconds: 5,
        //Cambio de Vista
        navigateAfterSeconds: getPage(),
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