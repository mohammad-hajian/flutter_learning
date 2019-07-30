//https://openweathermap.org

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/utility/Weather_8.dart';
import 'package:http/http.dart' as http;


class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String _cityEntered = 'isfahan';

  Future _goToNextScreen(_) async {
    Map res = await Navigator.push(_, new MaterialPageRoute<Map>(builder: (_) {
      return ChangeCity();
    }));
    if (res != null && res.containsKey('city')) {
      if ('${res['city']}'.isNotEmpty) {
        _cityEntered = res['city'];
      }else {
        _cityEntered = defaultCity;
        //برای زمانی که خالی اوکی میکنیم
      }
    } else {
      _cityEntered = defaultCity;
      //برای زمانی که بک میزنیم
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => _goToNextScreen(context))
          ],
        ),
        body: new Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/umbrella.png',
                width: 500,
                fit: BoxFit.fill,
              ),
            ),
            new Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.all(10),
                child: Text(
                  "${_cityEntered == null ? defaultCity : _cityEntered}",
                  style: textStyle(),
                )),
            new Container(
              alignment: Alignment.center,
//            or  alignment: Alignment(0, 0),
              child: Image.asset('images/light_rain.png'),
            ),
            new Container(
                margin: EdgeInsets.fromLTRB(20, 300, 0, 0),
                child: updateTempWidget(_cityEntered))
          ],
        ));
  }
}

class ChangeCity extends StatelessWidget {
  var _cityFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change City'),
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/white_snow.png',
              fit: BoxFit.fill,
              width: 200000,
              height: 20000,
            ),
          ),
          ListView(
            children: <Widget>[
              ListTile(
                title: TextField(
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Input City',
                    labelText: 'City',
                  ),
                ),
              ),
              ListTile(
                  title: new RaisedButton(
                      onPressed: () {
                       Navigator.pop(context, {'city': _cityFieldController.text});
                      },
                      child: Text('Get Weather'),
              ))
            ],
          ),
        ],
      ),
    );
  }
}

TextStyle textStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
}

TextStyle tempStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );
}

TextStyle subTempStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

Future<Map> getWeather(String appId, String city, String units) async {
  String apiUrl =
      'http://api.openweathermap.org/data/2.5/weather?q=$city,IR&APPID=$appId&units=$units';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}

Widget updateTempWidget(String city) {
  return new FutureBuilder(
      future: getWeather(appId, city == null ? defaultCity : city, units),
      builder: (BuildContext context, AsyncSnapshot<Map> snapShot) {
        // snapShot get data from future
        if (snapShot.hasData) {
          Map content = snapShot.data;
          return new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                content['cod'] != 200? Text('نام شهر غلط است',style: tempStyle(),):
                ListTile(
                 title: new Text( 'temperature: ${content['main']['temp']} C',
                    style: tempStyle(),
                  ),
                  subtitle: ListTile(
                    title: Text(
                      'main weather: ${content['weather'][0]['main']}',style: subTempStyle(),
                    ),
                    subtitle: Text(
                        'description weather: ${content['weather'][0]['description']}',style: subTempStyle(),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return new Container(child: Text('داده ای دریافت نشد'),);
        }
      });
}
