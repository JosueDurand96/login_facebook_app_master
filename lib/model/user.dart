import 'dart:convert';
import 'dart:io';
import 'dart:async';

class User {
  String token;
  String username;
  String type;

  //Recibir datos Rest se utiliza Future y async
  Future<dynamic> apiRequest(String url, Map jsonMap) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(jsonMap)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    var resbody = json.decode(reply);
    //Captura los datos del Post
    username = resbody['username'];

    token = resbody['token'];
    type = resbody['type'];
    //Prueba
    //print('nombreeee:    '+username);

  //  print('tokeeeen   '+tokens);
  //  print(type);
    httpClient.close();
    //retorna un String
    return reply;
  }

}