import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadWrite extends StatefulWidget {
  final title;

  ReadWrite(this.title);

  @override
  _ReadWriteState createState() => _ReadWriteState();
}

class _ReadWriteState extends State<ReadWrite> {
  var _enterFieldController = TextEditingController();
  String _savedDataField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new Container(
        padding: EdgeInsets.all(10.2),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: TextField(
                decoration: InputDecoration(hintText: 'write something'),
                controller: _enterFieldController,
              ),
              subtitle: RaisedButton(
                  color: Colors.greenAccent,
                  onPressed: () {
                    writeData('${_enterFieldController.text}');
                  },
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.5),
                      ),
                      Text('save data'),
                      Padding(
                        padding: EdgeInsets.all(10.5),
                      ),
                    ],
                  )),
            ),
            ListTile(
              title: FutureBuilder(
                  future: readData(),
                  builder: (_, AsyncSnapshot<String> data) {
                    if (data.hasData != null) {
                      return Center(
                        child: Text('${data.data}',
                            style: TextStyle(color: Colors.blueAccent)),
                      );
                    } else
                      return Center(
                        child: Text('Nothing',
                            style: TextStyle(color: Colors.red)),
                      );
                  }),
            )
          ],
        ),
      ),
    );
  }

  //region TODO shared_preferences
//لود در اول برنامه به صورت خودکار انجام می‌شود و باید خروجی آن را قرار دهیم. و ذخیره هم باید متود آن قرار داده شود
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }
  void _loadSavedData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getString('data').isNotEmpty && preferences.getString('data') != null) {
        _savedDataField = preferences.getString('data');
      } else {
        _savedDataField = 'empty data';
      }
    });
  }
  _saveData(String message) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('data', message); //{ Key: value }
  }
//endregion
}


Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path; // home/directory:text
}

Future<File> get _localFile async {
  final path = await _localPath;
  return new File('$path/data.txt'); //home/directory/data.txt
}

//write and read from our file
Future<File> writeData(String message) async {
  final file = await _localFile;
  return file.writeAsString('$message'); //write to file
}

Future<String> readData() async {
  try {
    final file = await _localFile;
    String data = await file.readAsString(); //read
    return data;
  } catch (ex) {
    return 'Nothing saved yet';
  }
}
