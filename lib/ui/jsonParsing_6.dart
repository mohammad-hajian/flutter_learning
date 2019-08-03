//https://jsonplaceholder.typicode.com
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;

class Quakes extends StatelessWidget {
  final Map quakes;

  Quakes(this.quakes);

  @override
  Widget build(BuildContext context) {
    print(quakes);
    return Scaffold(
      appBar: AppBar(
        title: Text("Quakes"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: quakes['features'].length,
            itemBuilder: (BuildContext context, int counter) {
              intl.DateFormat format = intl.DateFormat.yMMMMd("en_US").add_jm();
              DateTime time = DateTime.fromMillisecondsSinceEpoch(quakes['features'][counter]['properties']['time'],isUtc: true); //is utc true i.e local time
             String deformTime = format.format(time);
              return Column(
                children: <Widget>[
                  Divider(
                    height: 3,
                    color: Colors.greenAccent,
                  ),
                  new ListTile(
                    title: Text(
                        "time: $deformTime",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.pink,fontSize: 20)),
                    subtitle: Text(
                        "${quakes['features'][counter]['properties']['place']}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black,fontSize: 16)),
                    leading: new CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                          "${quakes['features'][counter]['properties']['mag']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                    onTap: (){
                      showAlertMessage(context, '${quakes['features'][counter]['properties']['type']}', '${quakes['features'][counter]['properties']['title']}');
                    }
                  ),
                ],
              );
            }),
      ),
    );
  }

  void showAlertMessage(BuildContext context, String title, String message) {
    var alert = new AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        FlatButton.icon(
            onPressed: (){Navigator.pop(context);} ,
//       or     onPressed: (){Navigator.of(context).pop(); } ,
            icon: Icon(Icons.check),
            label: Text("OK")
        )
//      FlatButton(
//          onPressed: () => Navigator.of(context).pop(),
//          child: Text("OK")
//      )
      ],
    );
    showDialog(context: context, builder: (context){return alert;});
  }
}

Future<Map> getQuakes() async {
  String apiUrl =
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}