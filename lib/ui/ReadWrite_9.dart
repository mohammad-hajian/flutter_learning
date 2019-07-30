import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ReadWrite extends StatefulWidget {
  final title;

  ReadWrite(this.title);

  @override
  _ReadWriteState createState() => _ReadWriteState();
}

class _ReadWriteState extends State<ReadWrite> {
  var _enterFieldController = TextEditingController();

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
                      Text('save text'),
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
