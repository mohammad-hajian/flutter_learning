import 'package:flutter/material.dart';
import 'package:flutter_app/ui/login_3.dart';
import 'ui/make-it-rain_2.dart';
import 'ui/home_1.dart';

//void main() => runApp(new MaterialApp(
//  title: "layouts",
//      home: new Home(),
//    ));

//void main() {
//  runApp(new MaterialApp(
//    title: "welcome app",
//    home: new Home(),
//  ));
//}

//void main(){
//  String title = "Gesture";
//  runApp(new MaterialApp(
//    title: title,
//    home: new Home(title: title,),
//  ));
//}

//void main(){
//  runApp(
//    new MaterialApp(
//      title: "make it rain!",
//      home: new MakeItRain(),
//    )
//  );
//}


void main(){
      final appTitle = "login";
  runApp(
    new MaterialApp(
      title: appTitle,
      home: Login(appTitle),
    )
  );
}