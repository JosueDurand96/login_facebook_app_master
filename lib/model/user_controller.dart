import 'package:login_facebook_app/model/user.dart';

class UserController {
  User obj = new User();
  //Funcion de Validar Usuario
  getTokenUser(String user, String pass) async {
    String url =
        'http://pichanga-env.3t9rtcf9rd.us-east-2.elasticbeanstalk.com/api/authenticate';
    Map map = {
      //Concatena los parametros que se va a enviar en el Post
      "application":"30","username":""+user,"password":""+pass,
    };
    //prueba de recepcion de user y pass
    print("mapeo : "+user);
    print("mapeo : "+pass);
    print(await obj.apiRequest(url, map));
  }
}