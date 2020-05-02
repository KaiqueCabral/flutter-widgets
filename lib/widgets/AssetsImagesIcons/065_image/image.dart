import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class ImagePage extends StatefulWidget {
  static const String routeName = "/image";

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
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
        title: Text("Image"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,
              crossAxisCount: 3,
            ),
            delegate: SliverChildListDelegate.fixed(
              [
                listItem(
                  Text(
                    "NetWork\nImages",
                    textAlign: TextAlign.center,
                  ),
                  context,
                ),
                listItem(
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                    semanticLabel: "Image of an owl from the internet",
                  ),
                  context,
                ),
                listItem(
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-3.jpg?v=5',
                    fit: BoxFit.cover,
                    width: 300,
                    semanticLabel: "Image of an owl from the internet",
                  ),
                  context,
                ),
                listItem(Text("Asset Images"), context),
                listItem(
                  Image.asset(
                    "assets/images/flutter-fade-in-image.jpg",
                    width: 300,
                    height: 100,
                    fit: BoxFit.cover,
                    alignment: Alignment(1, 1),
                    semanticLabel: "Image of Smartphones from the Assets",
                  ),
                  context,
                ),
                listItem(
                  Image.asset(
                    "assets/images/flutter-fade-in-image.jpg",
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain,
                    alignment: Alignment(1, 1),
                    colorBlendMode: BlendMode.multiply,
                    filterQuality: FilterQuality.low,
                    repeat: ImageRepeat.repeatY,
                    semanticLabel: "Image of Smartphones from the Assets",
                  ),
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(Widget child, BuildContext context) => Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: child,
        ),
      );
}
