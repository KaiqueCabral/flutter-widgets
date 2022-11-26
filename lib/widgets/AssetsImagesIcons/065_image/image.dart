import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ImagePage extends StatefulWidget {
  static const String routeName = "/image";

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  BannerAd? _ad;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      _ad = BannerAd(
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.largeBanner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
      );

      _ad?.load();
    }
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
        title: Text("Image"),
      ),
      bottomSheet: (!kIsWeb)
          ? Container(
              child: AdWidget(ad: _ad!),
              height: _ad!.size.height.toDouble(),
            )
          : Container(
              height: 0,
              width: 0,
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
                    "https://picsum.photos/seed/picsum/300/300",
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
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
                    "https://picsum.photos/seed/picsum/300/300",
                    fit: BoxFit.cover,
                    width: 300,
                    semanticLabel: "Image of an owl from the internet",
                  ),
                  context,
                ),
                listItem(
                  Text("Asset Images"),
                  context,
                ),
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
