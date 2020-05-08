import 'package:sample/src/pages/_ssh.dart';
import 'package:flutter/material.dart';

class GeoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeoState();
}

class GeoState extends State<GeoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static final _geoController = TextEditingController();
  bool _validateError = false;
  int selectedEndPoint = 2;

  @override
  void dispose() {
    _geoController.dispose();
    super.dispose();
  }

  List<String> endOptions = [
    "Download SRA only",
    "Splitted Fastq Files, QC",
    "PreProcessed FastQ Files, QC",
    "Aligned File",
    "Count Matrix",
    "DGE (R)",
    "gene ontology (R)"
  ];

  _dropdown(currentItem, _list, listname) {
    return DropdownButton<String>(
      hint: new Text("End Point", style: TextStyle(color: Colors.blue)),
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String newValue) {
        for(var i=0;i<endOptions.length;i++){
          if(endOptions[i]==newValue){
            selectedEndPoint = i+1;
          }
        }
        print(selectedEndPoint);
        setState(() {
        });
      },
      items: _list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "GeoID",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Input",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextField(
                        controller: _geoController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 3),
                          ),
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(.8)),
                          errorText:
                              _validateError ? 'GeoID is mandatory' : null,
                          hintText: 'GeoID/SRA ID',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child:
                        _dropdown(this.selectedEndPoint, this.endOptions, "End Point"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
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
              IndexState.GEOID = _geoController.text;
              IndexState.ENDPOINT = selectedEndPoint;
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
                            "Information",
                            style: TextStyle(color: Colors.blue),
                          ),
                          content: new Text(
                              "Automated Alignment pipeline of SRA data using Accession IDs"),
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
