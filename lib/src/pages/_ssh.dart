import 'package:flutter/material.dart';
import 'package:ssh/ssh.dart';
import 'package:flutter_local_notifications_extended/flutter_local_notifications_extended.dart';

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
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  initState() {
    super.initState();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: _onSelectNotification);
  }

  Future _onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text(
            "Complete!!",
            style: TextStyle(color: Colors.blue),
          ),
          content: Text("Your task has been completed."),
        );
      },
    );
  }

  Future _showNotificationWithDefaultSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Complete',
      'Your task has been completed.',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 450,
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
                          ),
                          onPressed: () {
                            Future<bool> test = executeSSH.execute(
                                _usernameController,
                                _passwordController,
                                _portController,
                                _hostController);
                            if (test == true) {
                              _showNotificationWithDefaultSound();
                            }
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
  static Future<bool> execute(
    TextEditingController username,
    TextEditingController password,
    TextEditingController port,
    TextEditingController address,
  ) async {
    var client = new SSHClient(
      host: address.text,
      port: int.parse(port.text),
      username: username.text,
      passwordOrKey: password.text,
    );
//    Do Not Change Anything Here
    await client.connect();
//    Enter Command To Execute on HPC
    String _command = "./scriptExecuter " + IndexState.GEOID; //comand here
    print(_command);
    print(await client.execute("make"));
    print(await client.execute(_command));
    print(client.disconnect());
    address.clear();
    port.clear();
    username.clear();
    password.clear();
    return true;
  }
}
