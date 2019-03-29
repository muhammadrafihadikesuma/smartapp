import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Jadwal extends StatefulWidget {
  @override
  _JadwalState createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.43.107/smartapp/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          }),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(9.0),
          child: Card(
            child: new ListTile(
              title: new Text("Hari : ${list[i]['hari']}"),
              leading: new Icon(Icons.calendar_today, size: 40,),
              subtitle: Text(list[i]['kelas']),
            ),
            
          ),
        
        );
      },
    );
  }
}

// class Jadwal extends StatelessWidget {

//   Future<List> getData() async{
//      final response = await http.get("http://192.168.43.107/smartapp/ambildata.php");
//      return json.decode(response.body);
//   }

// @override
// Widget build(BuildContext context){
//   return new Scaffold(
//       body: new FutureBuilder<List>(
//         future: getData(),
//         builder: (context, snapshot){
//           if(snapshot.hasError) print(snapshot.error);

//           return snapshot.hasData
//           ? new ItemList()
//           : new Center(child: new CircularProgressIndicator(),);
//         }
//       ),
//     );
//   }
// }
