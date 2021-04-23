import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NotificationListenerPage extends StatefulWidget {
  static const String routeName = "/notification-listener";
  NotificationListenerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NotificationListenerPageState createState() =>
      _NotificationListenerPageState();
}

class _NotificationListenerPageState extends State<NotificationListenerPage> {
  BannerAd _ad;

  @override
  void initState() {
    super.initState();

    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.fullBanner,
      request: AdRequest(),
      listener: AdListener(
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );

    _ad.load();
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Listener"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
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
