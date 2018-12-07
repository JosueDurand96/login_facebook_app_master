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
  final correovalidation3 = TextEditingController();

  final correovalidation = TextEditingController();

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Campo vacío",style: TextStyle(color: Colors.blueAccent)),
        );
      },
    );
  }

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
            if(correovalidation3.text.isEmpty){
             _showDialog();
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _SmsPageState()),
              );
            }

          },
          child: Text('Siguiente', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final field_gmail = TextFormField(
      controller: correovalidation3,
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
  final telefvalidator=TextEditingController();

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
            void _showDialog() {
              // flutter defined function
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Campo vacío",style: TextStyle(color: Colors.blueAccent)),
                  );
                },
              );
            }
            if(telefvalidator.text.isEmpty){
              _showDialog();
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _CheckSmsPageState()),
              );
            }

          },
          child: Text('Siguiente', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final field_number = TextFormField(
      controller: telefvalidator,

      keyboardType: TextInputType.phone,
      maxLength: 9,
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
  final validarnumero=TextEditingController();
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
            void _showDialog() {
              // flutter defined function
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Campo vacío",style: TextStyle(color: Colors.blueAccent)),
                  );
                },
              );
            }

            if(validarnumero.text.isEmpty){
              _showDialog();
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _RegisterDetailPageState()),
              );
            }

          },
          child: Text('Validar Numero', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final field_sms = TextFormField(
      controller: validarnumero,
      //Se relaciona el controller con el campo de texto
      keyboardType: TextInputType.phone,
      maxLength: 9,
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
  final nombreControl = TextEditingController();
  final apellidoPaternoControl = TextEditingController();
  final apellidoMaternoControl = TextEditingController();
  final emailcontrol = TextEditingController();
  final usuarioControl = TextEditingController();
  final passcontrol = TextEditingController();


  bool _autoValidate = false;
  String _name;
  String _email;
  String _mobile;
 final
  UserController obj1= new UserController();
  User objuuser = new User();
  String tok;
  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Campo vacío",style: TextStyle(color: Colors.blueAccent)),
          );
        },
      );
    }
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
      controller: nombreControl,
      keyboardType: TextInputType.text,
      validator: (String arg){
        if(arg.length < 3)
          return 'Name must be more than 2 charater';
        else
          return null;
      },
      onSaved: (String val) {
        _name = val;
      },
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
      controller: apellidoPaternoControl,
      keyboardType: TextInputType.multiline,
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
      controller: apellidoMaternoControl,
      keyboardType: TextInputType.multiline,
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
      controller: usuarioControl,
      keyboardType: TextInputType.multiline,
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
      controller: passcontrol,
      maxLength: 6,
      keyboardType: TextInputType.multiline,
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
            final nombreControl = TextEditingController();
            final apellidoPaternoControl = TextEditingController();
            final apellidoMaternoControl = TextEditingController();
            final emailcontrol = TextEditingController();
            final usuarioControl = TextEditingController();
            final passcontrol = TextEditingController();

            if(nombreControl.text.isEmpty||apellidoPaternoControl.text.isEmpty||apellidoMaternoControl.text.isEmpty||emailcontrol.text.isEmpty
            ||usuarioControl.text.isEmpty||passcontrol.text.isEmpty){
              _showDialog();
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (OptionSessionPage())),
              );
            }

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

