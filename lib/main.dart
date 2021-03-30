import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController ageController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController waistController = new TextEditingController();
  int _value1 = 1;
  int _value2 = 1;
  int _value3 = 1;
  int _value4 = 1;
  double bmi = 0.0;
  double absi = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ABSI Calculator'),
        ),
        body: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Sex", style: TextStyle(fontSize: 20)),
                    Container(
                      width: 100,
                      padding: EdgeInsets.all(5.0),
                      child: DropdownButton(
                          value: _value1,
                          items: [
                            DropdownMenuItem(
                              value: 1,
                              child: Center(
                                child: Text("Male"),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Center(
                                child: Text("Female"),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _value1 = value;
                            });
                          }),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Age", style: TextStyle(fontSize: 20)),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: TextField(
                            controller: ageController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: 75,
                          child: Text("years", style: TextStyle(fontSize: 17)),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Height", style: TextStyle(fontSize: 20)),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: TextField(
                            controller: heightController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: 75,
                          padding: EdgeInsets.all(5.0),
                          child: DropdownButton(
                              value: _value2,
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Center(
                                    child: Text("cm"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Center(
                                    child: Text("m"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Center(
                                    child: Text("in"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Center(
                                    child: Text("ft"),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value2 = value;
                                });
                              }),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Weight", style: TextStyle(fontSize: 20)),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: TextField(
                            controller: weightController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: 75,
                          padding: EdgeInsets.all(5.0),
                          child: DropdownButton(
                              value: _value3,
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Center(
                                    child: Text("kg"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Center(
                                    child: Text("lb"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Center(
                                    child: Text("stone"),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value3 = value;
                                });
                              }),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Waist \nCircumference",
                        style: TextStyle(fontSize: 20)),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: TextField(
                            controller: waistController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: 75,
                          padding: EdgeInsets.all(5.0),
                          child: DropdownButton(
                              value: _value4,
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Center(
                                    child: Text("cm"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Center(
                                    child: Text("m"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Center(
                                    child: Text("in"),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value4 = value;
                                });
                              }),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      color: Colors.blue,
                      // ignore: deprecated_member_use
                      child: OutlineButton(
                        child:
                            Text("Calculate", style: TextStyle(fontSize: 16,color: Colors.white)),
                        onPressed: calculateMe,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 350,
                      height: 35,
                      color: Colors.blue[100],
                      child: Text("Result", style: TextStyle(fontSize: 25)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("ABSI", style: TextStyle(fontSize: 20)),
                      width: 250,
                      height: 30,
                      color: Colors.blue[50],
                    ),
                    Container(
                      child: Text(absi.toStringAsFixed(5),style: TextStyle(fontSize: 20)),
                      width: 100,
                      height: 30,
                      color: Colors.blue[50],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateMe() {
    setState(() {
      double height = double.parse(heightController.text);
      double weight = double.parse(weightController.text);
      double waist = double.parse(waistController.text);

      if (_value2 == 1) {
        height = height / 100;
      } else if (_value2 == 3) {
        height = height / 39.37;
      } else if (_value2 == 4) {
        height = height / 2.205;
      }

       if(_value3==2){
        weight = weight / 2.2045;
      }
      else if(_value3==3){
        weight = weight / 0.1575;
      }

      if (_value4 == 1) {
        waist = waist / 100;
      } else if (_value4 == 3) {
        waist = waist / 39.37;
      }

      bmi = weight / (height * height);
      absi = waist / (pow(bmi, 2 / 3) * pow(height, 1 / 2));
      print(absi); 
    });
  }
}