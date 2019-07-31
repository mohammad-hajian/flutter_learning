import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/utility/databaseHelper_10.dart';

List users =[];

class DatabaseHome extends StatefulWidget {
  final title;

  DatabaseHome(this.title);

  @override
  _DatabaseHomeState createState() => _DatabaseHomeState();
}

class _DatabaseHomeState extends State<DatabaseHome> {
  var _usernameFieldController = TextEditingController();
  var _passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.title}'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: /*new ListView(*/
//          children: <Widget>[
//            ListTile(
//              title: TextField(
//                controller: _usernameFieldController,
//                keyboardType: TextInputType.text,
//                decoration: InputDecoration(labelText: 'username'),
//              ),
//            ),
//            ListTile(
//              title: TextField(
//                controller: _passwordFieldController,
//                keyboardType: TextInputType.text,
//                decoration: InputDecoration(labelText: 'username'),
//              ),
//            ),
//          ListTile(
//            title: RaisedButton(onPressed: () =>  saveData(), child: Text('ذخیره'),),
//          ),
//            ListTile(
//              title:users.length == 0 ? Text('خالی'): Text('${User.map(users.last).username }'),
//            ),
            ListView.builder(
                itemCount: users.length,
                itemBuilder: (_, int position) {
                  return Card(
                    color: Colors.lime.shade50,
                    elevation: 2,
                    child: ListTile(
                      title:
                          Text('user: ${User.map(users[position]).username}'),
                      subtitle: Text('id: ${User.map(users[position]).id}'),
                      leading: CircleAvatar(
                        child: Text(User.map(users[position]).username.length <1 ?'':'${User.map(users[position]).username}'
                            .substring(0, 1)),
                      ),
                    ),
                  );
                })
//          ],
//        )
    );
  }

  DatabaseHelper db = DatabaseHelper();
  void saveData() async {
   var res = await db.saveUser(User("${_usernameFieldController.text}", '${_passwordFieldController.text}'));
   String message = 'ذخیره نشد';
   if (res.isOdd || res.isEven) {
     message = 'با موفقیت ذخیره شد';
   }
       var alert = new AlertDialog(
         title: Text('وضعیت'),
         content: Text(message),
         actions: <Widget>[
           FlatButton.icon(
               onPressed: (){Navigator.pop(context);} ,
               icon: Icon(Icons.check),
               label: Text("OK")
           )
         ],
       );
       showDialog(context: context, builder: (context){return alert;});
         users =await db.getAllUsers();
       setState(() {
         users = users;
       });
  }
}
