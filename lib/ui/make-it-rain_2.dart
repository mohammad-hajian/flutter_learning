import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  MakeItRainState createState() => MakeItRainState();
}

class MakeItRainState extends State<MakeItRain> {
  int _MoneyCounter = 0;
  void _rainMoney(){
    //برای زمانی که گوشی نیاز به ریلود دارد
    setState(() {
    _MoneyCounter = _MoneyCounter + 100;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Make it Rain"),
        backgroundColor: Colors.blue,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                "Get Rich!",
                style: TextStyle(color: Colors.grey, fontSize: 30),
              ),
              new Expanded(
                  child: new Center(
                      child: new Text("$_MoneyCounter \$" ,
                          style: TextStyle(
                              color: _MoneyCounter >= 1000 ? Colors.greenAccent : Colors.amberAccent,
                              fontSize: 45,
                              fontWeight: FontWeight.w800)
                      )
                  ),
              ),
              new Expanded(
                  child: new Center(
                    child: new FlatButton(
                      color: Colors.lightGreen,
                        textColor: Colors.white70,
                        padding: EdgeInsets.all(15),
                        onPressed:() => _rainMoney(),
                        child: new Text(
                            "Let It Rain",
                          style: TextStyle(
                              fontSize: 20,
                          ),
                        )
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
