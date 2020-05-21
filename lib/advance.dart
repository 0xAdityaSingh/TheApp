import 'package:flutter/material.dart';

import 'src/pages/_ssh.dart';
import 'src/pages/_ssh.dart';

String _value = "1";
String _value2 = "1";
String radioItem = "1";
int MQS = 0;
int LW = 0;
int MRL = 0;
Color _selectedColor=Color.fromRGBO(3, 9, 23, 1);
class advance extends StatefulWidget {
  @override
  advanceState createState() => advanceState();
}

class advanceState extends State<advance> {
  static String GEOID = "";
  static int ENDPOINT = 2;
  final _mqs = TextEditingController();//Minimum qualtiy Score
  final _lw = TextEditingController();// Length of window,
  final _mrl = TextEditingController();// Minimum read length
  bool _validateError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                      "Advance Options",
                     textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
              ),
              Radiobutton(),
              // Container(height:40),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                    child: Text(
                            "Breakpoint",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                      Container(width:40),
                  Container(
                    color: _selectedColor,
                    child: DropdownButton<String>(
                      style: TextStyle(color: Colors.blue,fontSize: 18),
                      items: [
                        DropdownMenuItem(
                          value: "1",
                          child: Text(
                            "Get SRA dataset",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "2",
                          child: Text(
                            "Get fastq files",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "3",
                          child: Text(
                            "Get reference genome and annotations",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "4",
                          child: Text(
                            "Get Indexes",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "5",
                          child: Text(
                            "Get alignmnet bam file",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "6",
                          child: Text(
                            "Get sorted BAM/SAM files",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "7",
                          child: Text(
                            "Get Count matrix",
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value2 = value;
                          print(_value2);
                        });
                      },
                      value: _value2,
                    ),
                  ),
                ],
              ),
                        Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                    child: Text(
                            "Trimming",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                      Container(width:40),
                  Container(
                    color: _selectedColor,
                    child: DropdownButton<String>(
                      style: TextStyle(color: Colors.blue,fontSize: 18),
                      items: [
                        DropdownMenuItem(
                          value: "1",
                          child: Text(
                            "Remove rRNA contamination",

                          ),
                        ),
                        DropdownMenuItem(
                          value: "2",
                          child: Text(
                            "Trim reads",
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          print(_value);
                      if(value=="2"){
                            showDialog(
                        context: context,
                        builder: (BuildContext context) => new AlertDialog(
                              title: new Text(
                                "Input the values below",
                                style: TextStyle(color: Colors.blue),
                              ),
                              elevation: 24,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0)),
                            ));
                          }
                        });
                      },
                      value: _value,
                      
                    ),
                  ),
                ],
              ),
              Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: _mqs,
                                decoration: InputDecoration(
                                  errorText:
                                      _validateError ? 'Minimum qualtiy Score is mandatory' : null,
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 3),
                                  ),
                                  hintText: 'Minimum qualtiy Score',
                                ),
                              )),
                ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: _lw,
                                decoration: InputDecoration(
                                  errorText:
                                      _validateError ? 'Length of window is mandatory' : null,
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 3),
                                  ),
                                  hintText: 'Length of window',
                                ),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: _mrl,
                                decoration: InputDecoration(
                                  errorText:
                                      _validateError ? 'Minimum read length is mandatory' : null,
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 3),
                                  ),
                                  hintText: 'Minimum read length',
                                ),
                              )),
                            ),
              ])
            ],
          ),
        ),
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
              IndexState.MQS = _mqs.text;
              IndexState.LW = _lw.text;
              IndexState.MRL=_mrl.text;
              IndexState.GEOID = GEOID;
              IndexState.ENDPOINT = ENDPOINT;
              IndexState.RadioValue=radioItem;
              IndexState.Value1 = _value;
              IndexState.Value2 = _value2;
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
                          content: new Text("Parameters for the Pipeline"),// enter the details to show in alert box
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

  

  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[

            Container(

              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                child: Text(
                        "Remove rRNA Contamination",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          RadioListTile(
            // activeColor: Colors.white,
              groupValue: radioItem,
              title: Text('True', style: TextStyle(color: Colors.white,fontSize: 20),),
              value: '1',
              onChanged: (val) {
                setState(() {
                  radioItem = val;
                });
              },
            ),

           RadioListTile(
              groupValue: radioItem,
              title: Text('False',style: TextStyle(color: Colors.white,fontSize: 20),),
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



// Get sorted BAM/SAM files
// Get SRA dataset
// Get fastq files
// Get reference genome and annotations
// Get alignmnet bam file
// Get sorted BAM/SAM files
// Get Count matrix




// remove rRNA contamination
// trim reads    minimum quality score


// Minimum qualtiy Score, 
// Length of window, 
// Minimum read length