import 'dart:convert';
import 'package:flutter_app/ui/ReadWrite_9.dart';
import 'package:flutter_app/ui/jsonParsing_6.dart';
import 'package:flutter_app/ui/weather_8.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:flutter_app/ui/bmi_5.dart';
import 'models/User_10.dart';
import 'ui/databaseHome_10.dart';
import 'ui/navigatePage_7.dart';
import 'ui/noToDo_11.dart';
import 'ui/weight-on-planet_4.dart';
import 'package:flutter_app/ui/login_3.dart';
import 'ui/make-it-rain_2.dart';
import 'ui/home_1.dart';
import 'utility/databaseHelper_10.dart';

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

//TODO setState_2
//void main(){
//  runApp(
//    new MaterialApp(
//      title: "make it rain!",
//      home: new MakeItRain(),
//    )
//  );
//}

//TODO form field & validation & (Column VS ListView) & setState_good _3
//void main(){
//      final appTitle = "login";
//  runApp(
//    new MaterialApp(
//      title: appTitle,
//      home: Login(appTitle),
//    )
//  );
//}

//TODO radio_4
//void main(){
//      final appTitle = "WeightOnPlanet";
//  runApp(
//    new MaterialApp(
//      title: appTitle,
//      home: WeightOnPlanet(appTitle),
//    )
//  );
//}

//TODO Text field_5

//void main(){
//  final title = "BMI";
//  runApp(
//    new MaterialApp(
//      title: title,
//      home: new BMI(title),
//    )
//  );
//}

//TODO json parsing & List view &show alert_6
//void main() async {
//  Map quakes = await getQuakes();
//  int quakesLength = quakes['features'].length;
//  for (int i=0; i<quakesLength; i++) {
//    if ('${quakes['features'][i]['properties']['place']}'.contains("Iran")) {
//      print(quakes['features'][i]['properties']['place']);
//    }
//  }
//  runApp(new MaterialApp(
//    title: 'Quakes',
//    home: Quakes(quakes),
//  ));
//}

//TODO navigae page_7
//void main() {
//  runApp(new MaterialApp(
//    title: "page navigate",
//    home: new FirstPage(),
//  ));
//}

//TODO FutureBuilder_8
//void main() {
//  runApp(new MaterialApp(
//    title: "Weather",
//    home: new Weather(),
//  ));
//}

//TODO TextFile_9
//void main() async{
//  final title = 'ReadWrite';
//  runApp(new MaterialApp(
//    title: title,
//    home: new ReadWrite(title),
//  ));
//}

//TODO Database
//void main() async{
//  DatabaseHelper db = DatabaseHelper();
//  //get all users
//  users =await db.getAllUsers();
////  for (int i=0;i<users.length;i++) {
////    print('name: ${User.map(users[i]).username} & pass: ${User.map(users[i]).password} & userId: ${User.map(users[i]).id}');
////  }
//  //add user
////  int userSave = await db.saveUser(User("end user :D", 'no enymore'));
////  print('userSaveCode: $userSave');
////  //show count
////  int count = await db.getCount();
////  print('count: $count');
////  //get one user
////  User user = await db.getUser(count);
////  print('last user: userId: ${user.id} & name: ${user.username} & pass: ${user.password}');
////  //delete
////  int delete = await db.deleteUser(count);
////  print('delete: $delete');
//////update first user
////  User firstUser = User./*map*/fromMap(//فرقی نمیکنه
////      {
////        'username': 'first',
////        "password": "one",
////        "id": 1
////      });
////  int update = await db.updateUser(firstUser);
////  print('update: $update');
////
//  final title = 'Database';
//  runApp(new MaterialApp(
//    title: title,
//    home: DatabaseHome(title),
//  ));
//}

//TODO   pro setState & pro show dialog & flexible & pro listTile
//توی اسکرین یازده : سه تا نکته خیلی مهم است. دو تا توی دیالوگ و یکی توی اول بادی
void main() {
  final title = 'NoToDo';
  runApp(MaterialApp(
    title: title,
    home: NoToDo(title),
  ));
}
