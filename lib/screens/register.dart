import 'package:flutter/material.dart';
import 'package:login_facebook_app/utils/colors.dart';
import 'package:login_facebook_app/screens/menu.dart';
import 'package:login_facebook_app/model/user_controller.dart';
import 'package:login_facebook_app/model/user.dart';
import 'package:login_facebook_app/screens/option_session.dart';


class RegisterPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    final logo_gmail = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/correo.png'),
      ),
    );
    final button_gmail = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: canchaPrimaryLight,
        shadowColor: Colors.green.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _SmsPageState()),
            );
          },
          child: Text('Siguiente', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final field_gmail = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Correo',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo_gmail,
            SizedBox(height: 48.0),
            field_gmail,
            SizedBox(height: 48.0),
            button_gmail,
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
class _SmsPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logo_sms = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/sms.png'),
      ),
    );
    final button_number = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: canchaPrimaryLight,
        shadowColor: Colors.green.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _CheckSmsPageState()),
            );
          },
          child: Text('Siguiente', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final field_number = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Numero Celular',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo_sms,
            SizedBox(height: 48.0),
            field_number,
            SizedBox(height: 48.0),
            button_number,
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
class _CheckSmsPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logo_sms_validate = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/sms.png'),
      ),
    );
    final button_sms = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: canchaPrimaryLight,
        shadowColor: Colors.green.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _RegisterDetailPageState()),
            );
          },
          child: Text('Validar Numero', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final field_sms = TextFormField(
      //Se relaciona el controller con el campo de texto
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Numero de Validación',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo_sms_validate,
            SizedBox(height: 48.0),
            field_sms,
            SizedBox(height: 48.0),
            button_sms,
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

class _RegisterDetailPageState extends StatelessWidget {
  //Creacion de los nombres de los campos de texto lo cual se alamcena la data
  final emailcontrol = TextEditingController();
  final passcontrol = TextEditingController();

  UserController obj1= new UserController();
  User objuuser = new User();
  String tok;
  @override
  Widget build(BuildContext context) {
    final logo_register = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/register.png'),
      ),
    );
    final field_name = TextFormField(
      //Se relaciona el controller con el campo de texto
      controller: emailcontrol,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Nombres',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final field_last_name = TextFormField(
      //Se relaciona el controller con el campo de texto
      controller: emailcontrol,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Apellido Paterno',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final field_mother_last_name = TextFormField(
      //Se relaciona el controller con el campo de texto
      controller: emailcontrol,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Apellido Materno',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final field_user = TextFormField(
      //Se relaciona el controller con el campo de texto
      controller: emailcontrol,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Usuario',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final field_password = TextFormField(
      //Se relaciona el controller con el campo de texto
      controller: emailcontrol,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Contraseña',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final button_register = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: canchaPrimaryLight,
        shadowColor: Colors.green.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => (OptionSessionPage())),
            );
          },
          //() => Navigator.push(
          // context, MaterialPageRoute(builder: (context) => Menu()),
          //),
          // color: canchaPrimaryLight,
          child: Text('Registar Cuenta', style: TextStyle(color: Colors.white)),
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
            logo_register,
            SizedBox(height: 20.0),
            field_name,
            SizedBox(height: 20.0),
            field_last_name,
            SizedBox(height: 20.0),
            field_mother_last_name,
            SizedBox(height: 20.0),
            field_user,
            SizedBox(height: 20.0),
            field_password,
            SizedBox(height: 20.0),
            button_register
          ],
        ),
      ),
    );
  }
}

