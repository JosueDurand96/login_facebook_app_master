import 'package:flutter/material.dart';
import 'package:login_facebook_app/screens/Inicio/option_session.dart';

class RegisterDetailPageState extends StatefulWidget {
  static String tag2 = 'login-page';
  @override
  _RegisterDetailPageState createState() => new _RegisterDetailPageState();
}

class _RegisterDetailPageState extends State<RegisterDetailPageState> {
  //Creacion de los nombres de los campos de texto lo cual se alamcena la data
  final nombreControl = TextEditingController();
  final apellidoPaternoControl = TextEditingController();
  final apellidoMaternoControl = TextEditingController();
  final emailcontrol = TextEditingController();
  final celularcontrol = TextEditingController();
  final usuarioControl = TextEditingController();
  final passcontrol = TextEditingController();

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String  email, mobile;

  String name,apellidopat,apellidomat, usuario, password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Registrarse'),
          backgroundColor: Colors.green,
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: FormUI(),
            ),
          ),
        ),
      ),
    );
  }
  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(

          decoration: new InputDecoration(hintText: 'Nombres'),
          maxLength: 32,
          controller: nombreControl,
          validator: validateName,
          onSaved: (String val) {
            name = val;
          },
        ),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Apellido Paterno'),
          maxLength: 32,
          controller: apellidoPaternoControl,
          validator: validateName,
          onSaved: (String val) {
            apellidopat = val;
          },
        ),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Apellido Materno'),
          maxLength: 32,
          controller: apellidoMaternoControl,
          validator: validateName,
          onSaved: (String val) {
            apellidomat = val;
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Celular'),
            keyboardType: TextInputType.phone,
            controller: celularcontrol,
            maxLength: 9,
            validator: validateMobile,
            onSaved: (String val) {
              mobile = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Correo o Usuario'),
            keyboardType: TextInputType.emailAddress,
            controller: usuarioControl,
            maxLength: 32,
            validator: validateEmail,
            onSaved: (String val) {
              email = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Password'),
            keyboardType: TextInputType.text,
            maxLength: 6,
            controller: passcontrol,
            validator: validateName,
            onSaved: (String val) {
              mobile = val;
            }),
        new SizedBox(height: 15.0),
        new RaisedButton(
          onPressed: _sendToServer,
          child: new Text('Send'),
        )
      ],
    );
  }


  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Correo Incorrecto";
    }else {
      return null;
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Name $name");
      print("Mobile $apellidopat");
      print("Email $apellidomat");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => (OptionSessionPage())),
      );
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }



  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 9){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }
}


