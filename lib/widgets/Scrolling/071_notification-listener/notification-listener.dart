import 'package:flutter/material.dart';

class NotificationListenerPage extends StatefulWidget {
  static const String routeName = "/notification-listener";
  NotificationListenerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NotificationListenerPageState createState() =>
      _NotificationListenerPageState();
}

class _NotificationListenerPageState extends State<NotificationListenerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Listener"),
      ),
      body: NotificationListener(
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(index.toString()),
              ),
              title: Text("Item $index"),
            );
          },
        ),
        onNotification: (notification) {
          if (notification.runtimeType == ScrollEndNotification) {
            print((notification as ScrollEndNotification).dragDetails);
          }
          return true;
        },
      ),
    );
  }
}
