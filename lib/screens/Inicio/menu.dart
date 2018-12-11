import 'package:flutter/material.dart';
import 'package:login_facebook_app/screens/Inicio/option_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu  extends StatefulWidget {
  @override
  _MenuPageState createState() => new _MenuPageState();
}
class _MenuPageState extends State<Menu> {
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
  getStatusSharedPreferencesRemove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    print("borrando localstorage");

  }
  //Menu Widget
  Drawer _buildDrawer() {
    var fontFamily = "Roboto";
    var accountEmail = new Text(
        "@gmail.com",
        style: new TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 14.0,
            fontFamily: fontFamily
        )
    );
    var accountName = new Text(
        status,
        style: new TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 18.0,
            fontFamily: fontFamily
        )
    );
    var accountPicture = new CircleAvatar(
        child: new Icon(Icons.person_outline),
        backgroundColor: Theme.of(context).accentColor
    );

    var header = new UserAccountsDrawerHeader(
      accountEmail: accountEmail,
      accountName: accountName,
      currentAccountPicture: accountPicture,
      decoration: new BoxDecoration(
          color: Theme.of(context).cardColor
      ),
    );

    var tileItem1 = new ListTile(
      leading: new Icon(Icons.person),
      title: new Text("Cerrar Sesion"),
      subtitle: new Text("Sus datos de la sesion sera borradas."),
      onTap:(){
        getStatusSharedPreferencesRemove();
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => OptionSessionPage()),
        );
      },

    );
    var listView = new ListView(children: [header, tileItem1]);
    var drawer = new Drawer(child: listView);
    return drawer;
  }
  //click list del drawer
  void _onTap() {
    //Navigator.popAndPushNamed(context, AddPhotoActivity.routeName);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mi Pichanga"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search, color: Colors.white,),
            onPressed: () {},
          )
        ],
      ),
      drawer: _buildDrawer(),
      body: new PageView(
        children: <Widget>[
          //llamamos la class media_list.dart
          //new MediaList()
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(items: _getFooterItems()
      ),
    );
  }

  //Creacion de Tabs
  List<BottomNavigationBarItem>_getFooterItems(){
    return [
      new BottomNavigationBarItem(
          icon: new Icon(Icons.thumb_up),title: new Text("Vista 1")
      ),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.update),title: new Text("Vista 2")
      ),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.star),title: new Text("Vista 3")
      )
    ];
  }

}
