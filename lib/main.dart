import 'dart:convert';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'ui/home_1.dart';
import 'ui/make-it-rain_2.dart';
import 'ui/login_3.dart';
import 'ui/weight-on-planet_4.dart';
import 'ui/bmi_5.dart';
import 'ui/jsonParsing_6.dart';
import 'ui/navigatePage_7.dart';
import 'ui/weather_8.dart';
import 'ui/ReadWrite_9.dart';
import 'ui/databaseHome_10.dart';
import 'models/User_10.dart';
import 'utility/databaseHelper_10.dart';
import 'ui/noToDoScreen_11.dart';
import 'animation/counter_animation_12.dart';

//region main_1
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
//endregion

//region setState_2
//void main(){
//  runApp(
//    new MaterialApp(
//      title: "make it rain!",
//      home: new MakeItRain(),
//    )
//  );
//}
//endregion

//region form field & validation & (Column VS ListView) & setState_good _3
//void main(){
//      final appTitle = "login";
//  runApp(
//    new MaterialApp(
//      title: appTitle,
//      home: Login(appTitle),
//    )
//  );
//}
//endregion

//region radio_4
//void main(){
//      final appTitle = "WeightOnPlanet";
//  runApp(
//    new MaterialApp(
//      title: appTitle,
//      home: WeightOnPlanet(appTitle),
//    )
//  );
//}
//endregion

//region Text field_5
//void main(){
//  final title = "BMI";
//  runApp(
//    new MaterialApp(
//      title: title,
//      home: new BMI(title),
//    )
//  );
//}
//endregion

//region json parsing & List view &show alert_6
//void main() async {
////  Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
//  ServiceStatus serviceStatus = await PermissionHandler().checkServiceStatus(PermissionGroup.microphone);
////  bool isOpened = await PermissionHandler().openAppSettings();
////  bool isShown = await PermissionHandler().shouldShowRequestPermissionRationale(PermissionGroup.contacts);
//  Map quakes = await getQuakes();
////  int quakesLength = quakes['features'].length;
////  for (int i=0; i<quakesLength; i++) {
////    if ('${quakes['features'][i]['properties']['place']}'.contains("Iran")) {
////      print(quakes['features'][i]['properties']['place']);
////    }
////  }
//  runApp(new MaterialApp(
//    title: 'Quakes',
//    home: Quakes(quakes),
//  ));
//}
//endregion

//region navigate page_7
//void main() {
//  runApp(new MaterialApp(
//    title: "page navigate",
//    home: new FirstPage(),
//  ));
//}
//endregion

//region FutureBuilder_8
//void main() {
//  runApp(new MaterialApp(
//    title: "Weather",
//    home: new Weather(),
//  ));
//}
//endregion

//region TextFile_9
//void main() async{
//  final title = 'ReadWrite';
//  runApp(new MaterialApp(
//    title: title,
//    home: new ReadWrite(title),
//  ));
//}
//endregion

//region Database_10
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
//endregion

//region pro show dialog & flexible &  pro listTitle(classListTitle) & wrap & ModalBottomSheet & support fa-IR_11
//توی اسکرین یازده : سه تا نکته خیلی مهم است. دو تا توی دیالوگ و یکی توی اول بادی
void main() {
  final title = 'دفترچه یادداشت';
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
    ],
    locale: Locale("fa", "IR") ,// OR Locale('ar', 'AE') OR Other RTL locales,
    title: title,
    home: NoToDoScreen(title),
  ));
}
//endregion

//region animation_12
//void main() {
//  final title = 'Animation';
//  runApp(MaterialApp(
//    title: title,
//    theme: ThemeData(
//      primarySwatch: Colors.blue,
////      primaryColor: Colors.red
//    ),
//    home: Scaffold(body:Center(child: CounterAnimator()))
//  ));
//}
//endregion
