import 'package:flutter/material.dart';
import 'package:sample/src/pages/_ssh.dart';

class GeoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeoState();
}

class GeoState extends State<GeoPage> {
  final _geoController = TextEditingController();
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
      //   title: Text('GeoID'),
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
                    fontSize: 40,
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
                            // border: InputBorder.none,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(width: 3),
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(.8)),
                            errorText:
                                _validateError ? 'GeoID is mandatory' : null,
                            hintText: 'GeoID',
                          ),
                        )),
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
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IndexPage()),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
