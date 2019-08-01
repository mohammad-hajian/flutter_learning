import 'package:flutter/material.dart';

import 'noToDoScreen_11.dart';

class NoToDo extends StatefulWidget {
  final title;
  NoToDo(this.title);
  @override
  _NoToDoState createState() => _NoToDoState();
}

class _NoToDoState extends State<NoToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: NoToDoScreen(),
    );
  }
}
