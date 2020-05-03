import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/settings.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

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

  String _imageURL = "${Settings.apiURL}/images/flutter-small.jpg";

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
                  placeholder: "assets/images/loading.gif",
                  image: _imageURL,
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
              _imageURL = "${Settings.apiURL}/images/flutter-big.jpg";
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
