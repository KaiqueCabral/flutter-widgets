import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeInImagePage extends StatefulWidget {
  static const String routeName = "/fade-in-image";

  _FadeInImagePage createState() => _FadeInImagePage();
}

class _FadeInImagePage extends State<FadeInImagePage> {
  BannerAd _ad;

  @override
  void initState() {
    super.initState();

    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
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

  String _imageURL = "https://picsum.photos/seed/picsum/250/250";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fade In Image"),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            color: Colors.grey[100],
            child: AdWidget(ad: _ad),
            height: _ad.size.height.toDouble(),
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                    color: Colors.grey[100],
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: FadeInImage.assetNetwork(
                      fadeInDuration: Duration(
                        seconds: 1,
                      ),
                      fadeInCurve: Curves.easeInToLinear,
                      placeholder: "assets/images/loading.gif",
                      image: _imageURL,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
              _imageURL = "https://picsum.photos/seed/picsum/600/600";
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
