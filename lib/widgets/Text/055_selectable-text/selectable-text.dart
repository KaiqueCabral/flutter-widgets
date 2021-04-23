import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class SelectableTextPage extends StatefulWidget {
  static const String routeName = "/selectable-text";

  @override
  _SelectableTextPageState createState() => _SelectableTextPageState();
}

class _SelectableTextPageState extends State<SelectableTextPage> {
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
        title: Text("Selectable Text"),
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
