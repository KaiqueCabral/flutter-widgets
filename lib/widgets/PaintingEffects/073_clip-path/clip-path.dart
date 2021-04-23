import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class ClipPathPage extends StatefulWidget {
  static const String routeName = "/clip-path";

  @override
  _ClipPathPageState createState() => _ClipPathPageState();
}

class _ClipPathPageState extends State<ClipPathPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
    //..load()
    //..show();
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
        title: Text("Clip Path"),
      ),
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              clipPathMutual(BottomTriangleClipper(), Colors.teal),
              clipPathMutual(LeftTriangleClipper(), Colors.indigo),
              clipPathMutual(TopTriangleClipper(), Colors.green),
              clipPathMutual(RightTriangleClipper(), Colors.amber),
              clipPathMutual(StarClipper(), Colors.black),
            ],
          ),
          color: Colors.blue,
        ),
      ),
    );
  }

  clipPathMutual(CustomClipper<Path> customClipper, Color color) => ClipPath(
        clipper: customClipper,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
          ),
          width: 300,
          height: 300,
          child: Text(
            "Clip\nPath",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}

class TopTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RightTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LeftTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(0.0, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.5, size.height * 0.1);
    path.lineTo(size.width * 0.2, size.height * 0.9);
    path.lineTo(size.width * 0.9, size.height * 0.35);
    path.lineTo(size.width * 0.1, size.height * 0.35);
    path.lineTo(size.width * 0.8, size.height * 0.9);
    path.lineTo(size.width * 0.5, size.height * 0.1);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
