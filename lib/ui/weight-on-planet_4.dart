import 'package:flutter/material.dart';

class WeightOnPlanet extends StatefulWidget {
  final title;
  WeightOnPlanet(this.title);
  @override
  _WeightOnPlanetState createState() => _WeightOnPlanetState(title);
}

class _WeightOnPlanetState extends State<WeightOnPlanet> {
  final title;
  final TextEditingController _weightController = TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _finalText = "";

  _WeightOnPlanetState(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        color: Colors.yellow.shade100,
        child: new ListView(
          padding: EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset(
              'images/planet.png',
              height: 120
              ,width: 120,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Your Weight on earth",
                        hintText: 'in pounds',
//                      border: OutlineInputBorder(),
                        icon: Icon(Icons.person_outline)
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            new Radio(
                                activeColor: Colors.green,
                                value: 0, groupValue: radioValue, onChanged:(v)=> handleRadioValueChanged(v)// این دو تا مثل هم هستند
                            ),
                            Text("Pluto", style: TextStyle(color: Colors.blue.shade900),),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            new Radio(
                                activeColor: Colors.pinkAccent,
                                value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged// این دو تا مثل هم هستند
                            ),
                            Text("Mars", style: TextStyle(color: Colors.blue.shade900),),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            new Radio(
                                activeColor: Colors.black,
                                value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged
                            ),
                            Text("Venus", style: TextStyle(color: Colors.blue.shade900),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child:_finalResult<=0? new Text("لطفا یک عدد وارد کنید"): new Text(
                      "${_finalText}",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  }

  void handleRadioValueChanged(int value){
    /*
    Source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html
      Mercury: 0.38
Venus: 0.91
Earth: 1.00
Mars: 0.38
Jupiter: 2.34
Saturn: 1.06
Uranus: 0.92
Neptune: 1.19
Pluto: 0.06
     */
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text, .06);
          _finalText = "your weight in pluto is ${_finalResult} pounds";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, .38);
          _finalText = "your weight in pluto is ${_finalResult} pounds";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, .91);
          _finalText = "your weight in pluto is ${_finalResult} pounds";
      }

    });
  }
  double calculateWeight(String weight, double multiplier) {
    if(weight.isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight)*multiplier;
    }else return 0;
  }
}
