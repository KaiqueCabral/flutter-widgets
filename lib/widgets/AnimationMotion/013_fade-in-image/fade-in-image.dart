import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class FadeInImagePage extends StatefulWidget {
  static const String routeName = "/fade-in-image";

  _FadeInImagePage createState() => _FadeInImagePage();
}

class _FadeInImagePage extends State<FadeInImagePage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
      ..load()
      ..show(anchorOffset: 100);
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  String _imageURL =
      'https://img.ibxk.com.br/2019/10/29/flutter-29101357380259.jpg?w=200';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fade In Image"),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: Duration(
                    seconds: 1,
                  ),
                  fadeInCurve: Curves.easeInToLinear,
                  placeholder: kTransparentImage,
                  image: _imageURL,
                  height: 250,
                ),
              ),
              Container(
                child: Text("Flutter - Fade In Image"),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: FadeInImage.assetNetwork(
                  fadeInDuration: Duration(
                    seconds: 1,
                  ),
                  fadeInCurve: Curves.easeInToLinear,
                  placeholder: 'assets/images/loading.gif',
                  image:
                      'https://img.ibxk.com.br/2019/10/29/flutter-29101357380259.jpg?w=200',
                  //image has to be an URL
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.zoom_in,
          color: Colors.white,
        ),
        onPressed: () {
          setState(
            () {
              _imageURL =
                  "https://img.ibxk.com.br/2019/10/29/flutter-29101357380259.jpg?w=300";
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
