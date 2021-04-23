import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RichTextPage extends StatefulWidget {
  static const String routeName = "/rich-text";

  @override
  _RichTextPageState createState() => _RichTextPageState();
}

class _RichTextPageState extends State<RichTextPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //bannerAd = AdsStandard().createBannerAd(AdSize.mediumRectangle)
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
        title: Text("Rich Text"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            RichText(
              strutStyle: StrutStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              text: TextSpan(
                style: TextStyle(
                  fontFamily: "Arial",
                  fontSize: 24,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "This is a ",
                    style: TextStyle(),
                  ),
                  TextSpan(
                    text: "RichText",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " Widget",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(text: "."),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "As you can see above, you can use many text styles, such as:\n",
                    style: TextStyle(),
                  ),
                  TextSpan(
                    text: "bold",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ",",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(
                    text: " italic",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(
                    text: ", different Font Family",
                    style: TextStyle(fontFamily: "Arial"),
                  ),
                  TextSpan(
                    text: " and other stuffs.",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
