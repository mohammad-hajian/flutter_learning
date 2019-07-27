import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  final title;

  BMI(this.title);

  @override
  _BMIState createState() => _BMIState(title);
}

class _BMIState extends State<BMI> {
  final title;
  double bMI = 0.0;
  String bMIS = '';
  String bMIW = '';
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  _BMIState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
        titleSpacing: 50,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('images/bmilogo.png', width: 120, height: 120),
              Container(
                padding: EdgeInsets.all(10),
                height: 270,
                color: Colors.grey.shade300,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "age",
                          hintText: "e.g: 22",
                          icon: Icon(Icons.colorize)),
                    ),
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "height in meter",
                          hintText: "e.g: 1.73",
                          icon: Icon(Icons.ac_unit)),
                    ),
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "weight in kiloGram",
                          hintText: "e.g: 70.5",
                          icon: Icon(Icons.add_alarm)),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    new Container(
                      child: RaisedButton.icon(
                        onPressed: calculateBMI,
                        icon: Icon(Icons.add_alarm),
                        label: Text("calculate"),
                        color: Colors.lightBlue.shade800,
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                child: bMI <= 0
                    ? Text("insert",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.teal))
                    : Text(
                        "BMI: $bMIS",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.teal),
                      ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                child: bMI <= 0
                    ? Text("")
                    : Text(
                        "وضعیت: ${bMIW}",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.pink.shade300),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);
      if (age > 0 &&
          height > 0.0 &&
          weight > 0 &&
          _ageController.text.isNotEmpty &&
          _heightController.text.isNotEmpty &&
          _weightController.text.isNotEmpty) {
        bMI = weight / (height * height);
      } else
        bMI = 0;
      bMIS = bMI.toStringAsFixed(2);

      if (bMI < 18.5) {
        bMIW = 'کمبود وزن';
      } else if (bMI >= 18.5 && bMI < 25) {
        bMIW = 'استاندارد';
      } else if (bMI >= 25 && bMI < 30) {
        bMIW = 'اضافه وزن';
      } else if (bMI >= 30) {
        bMIW = 'اضافه وزن شدید';
      }
    });
  }
}
