import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


String gambar = "http://192.168.43.107/smartapp/img$gambar";

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {

    Future<List> getDataBeranda() async {
    final response =
        await http.get("http://192.168.43.107/smartapp/getberanda.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      body: new FutureBuilder<List>(
          future: getDataBeranda(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? new ItemListBeranda(
                    listberanda: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          }),
    );
  }
}
class ItemListBeranda extends StatelessWidget {

 final List listberanda;
  ItemListBeranda({this.listberanda});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listberanda == null ? 0 : listberanda.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(9.0),
          child: Card(
            child: new ListTile(
              title: new Text("Judul : ${listberanda[index]['judul']}"),
              leading: new Icon(Icons.calendar_today, size: 40,),
              subtitle: Text(listberanda[index]['berita']),
            ),
            
          ),
        
        );
      },
    );
  }
}