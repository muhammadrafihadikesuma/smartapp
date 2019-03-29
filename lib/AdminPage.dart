import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {

AdminPage({this.username});
final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hallo $username', style: TextStyle(fontSize: 20.0),),
      actions: <Widget>[
          FlatButton(
            child: Text("LogOUt"),
            onPressed: (){
              Navigator.pushReplacementNamed(context,'/HalamanLogin');
            },
          ),
      ],
      ),
    body: new ListTile(
      leading: Image.network('http://192.168.43.107/smartapp/getberanda.php'),
    ),
    );
  }
}