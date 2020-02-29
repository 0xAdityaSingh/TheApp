import 'package:flutter/material.dart';
import 'package:sample/src/pages/geo.dart';
import 'package:ssh/ssh.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  final _hostController = TextEditingController();
  final _portController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  static String GEOID = "";
  bool _validateError = false;

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "SSH",
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
                          textAlign: TextAlign.center,
                          controller: _hostController,
                          decoration: InputDecoration(
                            errorText:
                                _validateError ? 'Host is mandatory' : null,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(width: 3),
                            ),
                            hintText: 'Address',
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _portController,
                            decoration: InputDecoration(
                              errorText:
                                  _validateError ? 'Port is mandatory' : null,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              hintText: 'Port eg : 22',
                            ),
                          ))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _usernameController,
                            decoration: InputDecoration(
                              errorText: _validateError
                                  ? 'Username is mandatory'
                                  : null,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              hintText: 'Username',
                            ),
                          ))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              errorText: _validateError
                                  ? 'Password is mandatory'
                                  : null,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              hintText: 'Password',
                            ),
                          ))),
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
                            executeSSH.execute(_usernameController,_passwordController,_portController,_hostController);
                          },
                        ),
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

class executeSSH {
  static Future<void> execute(TextEditingController username, TextEditingController password, TextEditingController port, TextEditingController Address)
  async {
    var client = new SSHClient(
      host: Address.text,
      port: int.parse(port.text),
      username: username.text,
      passwordOrKey: password.text,
    );
//    Do Not Change Anything Here
    await client.connect();
//    Enter Command To Execute on HPC
    var currentTime = new DateTime.now();
    String Command = "echo This File is Created on "+currentTime.toString()+" Using SSH > C:/Users/Hardik/Desktop/SSH.txt";
    await client.execute(Command);
    await client.disconnect();
    Address.clear();
    port.clear();
    username.clear();
    password.clear();
    return;
  }

}