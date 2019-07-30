import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController _nameFieldController = new TextEditingController();
  Future _gotToNextPage(BuildContext context) async{
    Map result = await Navigator.push(
        context, new MaterialPageRoute(
        builder: (_){
          return new NextPage(inputFromFirstPage: _nameFieldController.text,);
        }
    ));
    if (result!=null && result.containsKey('info')) {
      _nameFieldController.text = '${result['info']}';
    }else {
      _nameFieldController.text = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: TextField(
              controller: _nameFieldController,
              decoration: InputDecoration(labelText: 'Input Your Name'),
            ),
          ),
          ListTile(
            title: new RaisedButton(
              onPressed: () {return _gotToNextPage(context);},
              child: Text('Send to Next Screen'),
            ),
          )
        ],
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String inputFromFirstPage;

  NextPage({this.inputFromFirstPage = 'mohammad', Key key}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  var _backTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('next page'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                title: new Text('${widget.inputFromFirstPage}'),
              ),
              ListTile(
                title: TextField(
                  controller: _backTextFieldController,
                ),
              ),
              ListTile(
                title: FlatButton(
                    onPressed: (){
                      Navigator.pop(context,{
                        'info' :_backTextFieldController.text
                      });
                    },
                    child: Text('Send Data Back')
                ),
              )
            ],
          ),
        ));
  }
}
