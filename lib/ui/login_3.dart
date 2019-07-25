import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final String appTitle;
  Login(this.appTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: new AppBar(
        backgroundColor: Colors.blue.shade900,
        title: new Text(appTitle),
        centerTitle: true,
      ),
      body: CustomLoginForm(),
    );
  }
}


//Data Class
class _LoginData{
  String name = "";
  String password = "";
}

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();
  _LoginData _data = new _LoginData();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
                "./images/face.png",
              width: 90,
              height: 90,
              color: Colors.pink,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  gapPadding: 5,
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              validator: (c){
                if(c.isEmpty){
                  return "خالی نباشد";
                }else{
                  _data.name = c;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new TextFormField(
              obscureText: true,
              decoration: new InputDecoration(
                labelText: "Password",
                  border: OutlineInputBorder(
                      gapPadding: 5,
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
              validator: (c){
                if(c.isEmpty){
                  return "خالی نباشد";
                }else _data.password = c;
              },
            ),
          ),

          //add buttons
          new Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        _data.name = _data.name;
                      });
                      if(_formKey.currentState.validate()){
                        Scaffold.of(context).showSnackBar(SnackBar(content:Text("name: ${_data.name} & password: ${_data.password}")));
                      }
                    },
                    child: Text("Submit"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                    onPressed: (){
                        _formKey.currentState.reset();
                      setState(() {
                        _data.name = "";
                      });
                    } ,
                    child: Text("Clear"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child:_data.name.isEmpty ? Text("") : new Text(
                    "hello ${_data.name}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                )
            ),
          ),
        ],
      ),
    );
  }
}

