import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SelectableTextPage extends StatefulWidget {
  static const String routeName = "/selectable-text";

  @override
  _SelectableTextPageState createState() => _SelectableTextPageState();
}

class _SelectableTextPageState extends State<SelectableTextPage> {
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
        title: Text("Selectable Text"),
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
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text("You cannot select this text."),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "You"),
                      TextSpan(
                        text: " cannot",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " select",
                      ),
                      TextSpan(
                        text: " this text.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: SelectableText(
                  "This is a Selectable Text, so, you may select it.",
                  toolbarOptions: ToolbarOptions(
                    copy: true,
                    cut: true,
                    paste: false,
                    selectAll: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
