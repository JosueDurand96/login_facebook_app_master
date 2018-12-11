
import 'package:flutter/material.dart';
import 'package:login_facebook_app/utils/colors.dart';
import 'package:login_facebook_app/screens/Inicio/menu.dart';
import 'package:login_facebook_app/model/user_controller.dart';
import 'package:login_facebook_app/model/user.dart';
import 'package:login_facebook_app/screens/Registrar/register.dart';
import 'package:login_facebook_app/screens/Inicio/login.dart';

class OptionSessionPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _OptionSessionPageState createState() => new _OptionSessionPageState();
}

class _OptionSessionPageState extends State<OptionSessionPage> {
  //Creacion de los nombres de los campos de texto lo cual se alamcena la data
  final emailcontrol = TextEditingController();
  final passcontrol = TextEditingController();

  UserController obj1= new UserController();
  User objuuser = new User();
  String tok;
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo_login.png'),
      ),
    );

    final login = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: canchaPrimaryLight,
        shadowColor: Colors.green.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()),
          ),
          // color: canchaPrimaryLight,
          child: Text('Ingresar', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final session_activation = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: canchaPrimaryLight,
        shadowColor: Colors.green.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed:
          //Se llama la funcion de la Clase user_controller
              () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()),
          ),
          // color: canchaPrimaryLight,
          child: Text('Registrarse', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    //Orden la los campos de texto y botoners
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            login,
            SizedBox(height: 8.0),
            session_activation,
          ],
        ),
      ),
    );
  }
}
