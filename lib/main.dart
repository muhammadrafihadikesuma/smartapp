import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_app/AdminPage.dart';
import 'package:smart_app/MemberPage.dart';

void main() => runApp(MyApp());

String username='';

class MyApp extends StatelessWidget {
 
 @override
 Widget build(BuildContext context){
   return new MaterialApp(
     debugShowCheckedModeBanner: false,
   title: 'Smart App',
   home: new HalamanLogin(),
   routes: <String,WidgetBuilder>{
          '/AdminPage': (BuildContext context)=> new AdminPage(username: username,),
          '/MemberPage': (BuildContext context)=> new MemberPage(username: username,),
          '/HalamanLogin': (BuildContext context)=> new HalamanLogin(),
   },
 ); 
}
}

class HalamanLogin extends StatefulWidget {
  
  @override
  _HalamanLoginState createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  


  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg='';

 

  Future <List> _login () async{
    final response = await http.post("http://192.168.43.107/smartapp/login.php", body:{
      "username": user.text,
      "password": pass.text,
    });
var datauser = json.decode(response.body);

  if(datauser.length==0){
    setState(() {
          msg="Login Gagal";
        });
  }else{
    if(datauser[0]['jabatan']=='admin'){
       Navigator.pushReplacementNamed(context, '/AdminPage');
    }else if(datauser[0]['jabatan']=='member'){
      Navigator.pushReplacementNamed(context, '/MemberPage');
    }

    setState(() {
          username= datauser[0]['username'];
        });

  }

  return datauser;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bermain Dengan Flutter"),),

// MENGATASI OVERLOAD DENGAN MENGGUNAKAN SingleChildScrollView

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              FlutterLogo(
                size: 200,
              ),
              SizedBox(
                height: 50,
              ),

              // UNTUK USERNAME 
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     "Email",
          //     style: TextStyle(color: Colors.grey, fontSize: 16.0),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                new Expanded(
                  child: TextField(

                    controller: user,
                    
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Masukkan Username',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
              // TextFormField(
              //   autofocus: false,
              //   controller: user,
              //   textInputAction: TextInputAction.next,
              //   decoration: InputDecoration(
                  
              //     icon: Icon(Icons.person_outline),
              //     labelText: 'Username',
              //   ),
              // ),
              
              // Untuk PASWORD
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.lock_open,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                new Expanded(
                  child: TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Masukkan Password',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),

          // Untuk Login
     
          new Container(
               decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blue[400],
            ),
            margin:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    
                    // padding: const EdgeInsets.symmetric(
                    //     vertical: 15.0, horizontal: 15.0
                    //     ),
                        
                    // color: Colors.blue,
                    onPressed: () => {
                      _login(),
       
     

                      
                      
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(color: Colors.white70, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(msg, style: TextStyle(color: Colors.red),)
              // TextFormField(
              //   controller: pass,
              //   obscureText: true,
              //   textInputAction: TextInputAction.done,
              //   decoration: InputDecoration(
              //     icon: Icon (Icons.lock_open),
              //     labelText: 'Password',
        

              //   ),
                  
              // ),
            //  RaisedButton(
               
               
               
            //    child: Text("Login"),
               
            //  onPressed: (){
            //    _login();
            //  },
            //  ),

            ],
          ),
        ),
      ),
      ),
    );
  }
}