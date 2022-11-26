import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TooltipPage extends StatefulWidget {
  static const String routeName = "/tooltip";

  @override
  _TooltipPageState createState() => _TooltipPageState();
}

class _TooltipPageState extends State<TooltipPage> {
  BannerAd? _ad;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      _ad = BannerAd(
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.fullBanner,
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
        title: Text("Tooltip"),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Tap and hold the icons",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: "add_location",
                  transitionOnUserGestures: true,
                  child: Tooltip(
                    //Only Tooltip
                    message: "Only Tooltip (default)",
                    height: 30,
                    preferBelow: true,
                    showDuration: Duration(seconds: 2),
                    verticalOffset: 50,
                    child: Icon(
                      Icons.add_location,
                      color: Colors.red,
                      size: 100.0,
                    ),
                  ),
                  placeholderBuilder: (context, size, widget) {
                    return Container(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              Expanded(
                child: Hero(
                  tag: "delete",
                  transitionOnUserGestures: true,
                  child: TooltipTheme(
                    data: TooltipThemeData(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.9),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: Tooltip(
                      message: 'TooltipTheme\nDefined by properties',
                      child: Icon(
                        Icons.delete,
                        color: Colors.red[900],
                        size: 100.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
