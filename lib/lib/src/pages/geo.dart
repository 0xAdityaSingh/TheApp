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

  @override
  void dispose() {
    _geoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      // appBar: AppBar(
      //   title: Text(
      //     'Test',
      //     style: TextStyle(
      //         color: Color.fromRGBO(3, 9, 23, 1), fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.lightBlueAccent,
      // ),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.lightBlueAccent,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                            onPressed: () {}),
                      ),
                    )
                  ],
                ),
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
              onPressed: () {},
            ),
          ],
        ),
        color: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
