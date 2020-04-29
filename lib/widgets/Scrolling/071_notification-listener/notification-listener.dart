import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class NotificationListenerPage extends StatefulWidget {
  static const String routeName = "/notification-listener";
  NotificationListenerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NotificationListenerPageState createState() =>
      _NotificationListenerPageState();
}

class _NotificationListenerPageState extends State<NotificationListenerPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    bannerAd = AdsStandard().createBannerAd(AdSize.banner)
      ..load()
      ..show();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Listener"),
      ),
      body: NotificationListener(
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 55),
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(index.toString()),
              ),
              title: Text("Item ${(index + 1).toString().padLeft(2, '0')}"),
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
