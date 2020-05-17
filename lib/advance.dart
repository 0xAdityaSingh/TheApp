import 'package:flutter/material.dart';

import 'src/pages/_ssh.dart';

String _value = "1";
Color _selectedColor=Color.fromRGBO(3, 9, 23, 1);
class advance extends StatefulWidget {
  @override
  advanceState createState() => advanceState();
}

class advanceState extends State<advance> {
  static String GEOID = "";
  static int ENDPOINT = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                  "Advanced Options",
                 textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                ),
          ),
          Radiobutton(),
          Container(height:40),
          Center(
            
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(
                    "Trimming",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(width:40),
              Container(
                color: _selectedColor,
                child: DropdownButton<String>(
                  style: TextStyle(color: Colors.blue,fontSize: 20),
                  items: [
                    DropdownMenuItem(
                      value: "1",
                      child: Text(
                        "Low",
                        
                      ),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text(
                        "Moderate",
                      ),
                    ),
                    DropdownMenuItem(
                      value: "3",
                      child: Text(
                        "High",
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                      print(_value);
                    });
                  },
                  value: _value,
                ),
              ),
            ],
          ),
    ),
        ],
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.navigate_next,
          size: 45,
          color: Colors.blue,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              // IndexState.GEOID = _geoController.text;
              IndexState.GEOID = GEOID;
              IndexState.ENDPOINT = ENDPOINT;
              return IndexPage();
            }),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.help_outline),
              color: Colors.black,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => new AlertDialog(
                          title: new Text(
                            "Advance Options",
                            style: TextStyle(color: Colors.blue),
                          ),
                          content: new Text("XXXXXXXXX"),// enter the details to show in alert box
                          elevation: 24,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                        ));
              },
            ),
          ],
        ),
        color: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
class Radiobutton extends StatefulWidget {
  @override
  RadioButtonWidget createState() => RadioButtonWidget();
}

class RadioButtonWidget extends State {

  String radioItem = '1';

  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[

            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 30, 0, 30),
                child: Text(
                        "Radio",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          RadioListTile(
            // activeColor: Colors.white,
              groupValue: radioItem,
              title: Text('Radio Button Item 1', style: TextStyle(color: Colors.white,fontSize: 20),),
              value: '1',
              onChanged: (val) {
                setState(() {
                  radioItem = val;
                });
              },
            ),

           RadioListTile(
              groupValue: radioItem,
              title: Text('Radio Button Item 2',style: TextStyle(color: Colors.white,fontSize: 20),),
              value: '2',
              onChanged: (val) {
                setState(() {
                  radioItem = val;
                });
              },
            ),

          //  Text('$radioItem', style: TextStyle(color: Colors.white,fontSize: 20),)//printing items
          
        ],
    );
  }
}