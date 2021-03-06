import 'package:flutter/material.dart';
import 'package:login_facebook_app/screens/Registrar/CheckSmsPageState.dart';
import 'package:login_facebook_app/screens/Registrar/RegisterDetailPageState.dart';
import 'package:login_facebook_app/utils/colors.dart';

class SmsPageState extends StatefulWidget {


  static String tag3 = 'login-page';
  @override
  _SmsPageState createState() => new _SmsPageState();

}
class _SmsPageState extends State<SmsPageState>{
  final telefvalidator=TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String  email, mobile;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(

        body: new Center(
          child: new Container(
            margin: new EdgeInsets.only(left: 10.0,right: 10.0,top: 100.0,bottom: 10.0),
            padding: new  EdgeInsets.only(left: 10.0,right: 10.0,top: 100.0,bottom: 0.0),
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
        new CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/sms.png'),
        ),

        new TextFormField(

            decoration: new InputDecoration(hintText: 'Celular'),
            keyboardType: TextInputType.phone,
            controller: telefvalidator,
            maxLength: 9,
            validator: validateMobile,
            onSaved: (String val) {
              mobile = val;
            }),

        new SizedBox(height: 50.0),

        new Padding(
          padding: EdgeInsets.symmetric(vertical: 14),

          child: Material(
            borderRadius: BorderRadius.circular(30.0),

            color: canchaPrimaryLight,
            shadowColor: Colors.green.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 400.0,
              height: 50.0,
              onPressed: (){
                _sendToServer();
              },
              child: Text('Siguiente', style: TextStyle(color: Colors.white,fontSize: 22)),
            ),
          ),


        )
      ],
    );
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "No puede estar vacío el campo";
    } else if(value.length != 9){
      return "Escribir los 9 digitos";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();

      print("celular $mobile");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => (CheckSmsPageState())),
      );
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}