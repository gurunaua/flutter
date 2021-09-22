import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterLocalNotificationsPlugin notificationsPlugin = new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidInit = new AndroidInitializationSettings("ic_launcher");
    var iosInit = new IOSInitializationSettings();
    var iniSettings =
        new InitializationSettings(android: androidInit, iOS: iosInit);
    notificationsPlugin.initialize(iniSettings,
        onSelectNotification: notificationSelected);
  }

  Future notificationSelected(String? payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Notification : $payload"),
      ),
    );
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Coba-coba", "This is my channel",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
    new NotificationDetails(android: androidDetails, iOS: iSODetails);

    // await notificationsPlugin.show(
    //     0, "Task", "You created a Task",
    //     generalNotificationDetails, payload: "ini diclick");

    var schedule = DateTime.now().add(Duration(seconds: 3));

    await notificationsPlugin.schedule(
        0, "Task", "You created a Task",
        schedule,
        generalNotificationDetails, payload: "ini diclick");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              RaisedButton(child: Text("Show notif"), onPressed: _showNotification,)
            ],
          ),
        ));
  }
}
