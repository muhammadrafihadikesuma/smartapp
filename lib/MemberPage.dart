import 'package:flutter/material.dart';


import 'siswa/beranda.dart' as beranda;
import 'siswa/jadwal.dart' as jadwal;
// import 'package:smart_app/main.dart';

class MemberPage extends StatelessWidget {



MemberPage({this.username});
final String username;

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
      child: Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[400],
        
        leading: Icon(Icons.person, size: 20,),
      //  Menghapus spasi pada title 
        titleSpacing: 0 ,
        title: Text('Welcome $username', style: TextStyle(fontSize: 17.0,) ),
        actions : <Widget>[
          FlatButton.icon( 
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            label: Text("Logout", style: TextStyle(color: Colors.white),),
            
            onPressed: (){
              Navigator.pushReplacementNamed(context,'/HalamanLogin');
            },
          ),
        ],
        bottom: TabBar(
          
          unselectedLabelColor: Colors.white,
          labelColor: Colors.yellow[700],
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home), text: "Beranda"),
            Tab(icon: Icon(Icons.schedule), text: "Jadwal"),
            Tab(icon: Icon(Icons.person), text: "Profil"),
          ],
        ),
        ),
      body: TabBarView(children: <Widget>[
        new beranda.Beranda(),
        new jadwal.Jadwal(),
        Text("Halaman Profil"),
      ],),
      ),
      )
    );
  }
}
        // actions: <Widget>[
        //             FlatButton(
        //     textColor: Colors.white,
        //     child: Text("Logout", style: TextStyle(fontSize: 20, color: Colors.black54),),
        //     onPressed: (){
        //       Navigator.pushReplacementNamed(context,'/HalamanLogin');
        //     },
        //   ),
        // ],
      // body: Center(

      //   child: Text('Hallo $username', style: TextStyle(fontSize: 20.0),),
      // ),