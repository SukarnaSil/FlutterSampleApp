import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeScreen createState() => HomeScreen();
}

class Battalion {
  int value;
  String name;

  Battalion(this.value, this.name);
}

class Strength {
  int value;
  String name;

  Strength(this.value, this.name);
}

class HomeScreen extends State<Home> {
  List<Battalion> _dropdownItems = [
    Battalion(1, "SAP 1st Battalion"),
    Battalion(2, "SAP 2nd Battalion"),
    Battalion(3, "SAP 3rd Battalion"),
    Battalion(4, "SAP 4th Battalion"),
    Battalion(4, "SAP 6th Battalion"),
    Battalion(4, "SAP 7th Battalion")
  ];

  List<Strength> _dropdownItemsStrength = [
    Strength(1, "Available Strength"),
    Strength(2, "Actual Strength"),
    Strength(3, "Vacancy"),
  ];

  List<DropdownMenuItem<Battalion>> _dropdownMenuItems;
  Battalion _selectedBattalion;

  List<DropdownMenuItem<Strength>> _dropdownMenuItemsList;
  Strength _selectedStrength;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedBattalion = _dropdownMenuItems[0].value;

    _dropdownMenuItemsList = buildDropDownMenuStrngth(_dropdownItemsStrength);
    _selectedStrength = _dropdownMenuItemsList[0].value;
  }

  List<DropdownMenuItem<Battalion>> buildDropDownMenuItems(List Battalions) {
    List<DropdownMenuItem<Battalion>> items = List();
    for (Battalion battalion in Battalions) {
      items.add(
        DropdownMenuItem(
          child: Text(battalion.name),
          value: battalion,
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<Strength>> buildDropDownMenuStrngth(List Strengths) {
    List<DropdownMenuItem<Strength>> strengthItems = List();
    for (Strength strength in Strengths) {
      strengthItems.add(
        DropdownMenuItem(
          child: Text(strength.name),
          value: strength,
        ),
      );
    }
    return strengthItems;
  }

  int _value = 1;
  String itemVal, result;
  TextEditingController num1controller = new TextEditingController();
  TextEditingController num2controller = new TextEditingController();
  TextEditingController num3controller = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Dropdown Button"),
      ),
      backgroundColor: Colors.grey[350],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey,
                border: Border.all()),
            child: DropdownButton<Battalion>(
                value: _selectedBattalion,
                items: _dropdownMenuItems,
                onChanged: (battalion) {
                  setState(() {
                    _selectedBattalion = battalion;
                  });
                }),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey,
                border: Border.all()),
            child: DropdownButton<Strength>(
                value: _selectedStrength,
                items: _dropdownMenuItemsList,
                onChanged: (strength) {
                  setState(() {
                    _selectedStrength = strength;
                  });
                }),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "COMMANDANT :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Padding(
                    padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: num1controller,
                            decoration: InputDecoration(
                              hintText: "02",
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                            )),
                      ),
                    )),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "DEPUTY COMMANDANT :",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Padding(
                    padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        child: TextField(
                          controller: num2controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "02",
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                            )),
                      ),
                    )),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: new Text(
                  "Assistant Commandant",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Padding(
                    padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        child: TextField(
                            controller: num3controller,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "02",
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                            )),
                      ),
                    )),
              )
            ],
          ),
          FlatButton(
            onPressed: () {
            setState(() {
            int sum = int.parse(num1controller.text) + int.parse(num2controller.text);
            result = sum.toString();
            displaySnackBar(context);
            });
            
            },
            color: Colors.black,
            child: Text("Calculate", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
        content: Text(result));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
