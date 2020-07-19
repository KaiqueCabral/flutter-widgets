import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class ClipOvalPage extends StatefulWidget {
  static const String routeName = "/clip-oval";
  @override
  _ClipOvalPageState createState() => _ClipOvalPageState();
}

class _ClipOvalPageState extends State<ClipOvalPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
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
        title: Text("Clip Oval"),
      ),
      body: Center(
        child: ClipOval(
          child: Container(
            color: Colors.amber[100],
            height: 300,
            width: 300,
            child: Stack(
              children: [
                ClipOval(
                  clipper: ClipperOval(
                    left: 75,
                    top: 0,
                    height: 300,
                    width: 150,
                  ),
                  child: Container(
                    color: Colors.blue[300],
                  ),
                ),
                ClipOval(
                  clipper: ClipperOval(
                    left: 0,
                    top: 75,
                    height: 150,
                    width: 300,
                  ),
                  child: Container(
                    color: Colors.green[300],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClipperOval extends CustomClipper<Rect> {
  final double top;
  final double left;
  final double width;
  final double height;
  ClipperOval({this.left, this.top, this.width, this.height});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(this.left, this.top, this.width, this.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
