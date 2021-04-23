import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class MediaQueryPage extends StatefulWidget {
  static const String routeName = "/media-query";

  @override
  _MediaQueryPageState createState() => _MediaQueryPageState();
}

class _MediaQueryPageState extends State<MediaQueryPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //bannerAd = AdsStandard().createBannerAd(AdSize.banner)
    //..load()
    //..show();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  _mutualExpanded(String _text) => Expanded(
        child: Container(
          color: Colors.indigo,
          child: Text(
            _text,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          padding: EdgeInsets.all(20),
        ),
        flex: 1,
      );

  _footerExpanded(String _text, Color _color, int _flex) => Expanded(
        flex: _flex,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 5,
          ),
          color: _color,
          child: Center(
            child: Text(
              _text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var _margin, _width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Media Query"),
      ),
      backgroundColor: Colors.yellow[100],
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (_mediaQuery.orientation == Orientation.landscape) {
            _width = _mediaQuery.size.width * 0.8;
            _margin = EdgeInsets.symmetric(
              horizontal: _mediaQuery.size.width * 0.1,
            );
          } else {
            _width = _mediaQuery.size.width;
            _margin = EdgeInsets.all(0);
          }

          return Container(
            width: _width,
            margin: _margin,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.teal,
                  height: _mediaQuery.size.height * 0.2,
                  child: Center(
                    child: Text(
                      "Using Container with resizing Height",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    _mutualExpanded("Card 1"),
                    _mutualExpanded("Card 2"),
                    _mutualExpanded("Card 3"),
                  ],
                ),
                _footerExpanded("Using Flex 1", Colors.red[200], 1),
                _footerExpanded("Using Flex 2", Colors.red[400], 2),
                _footerExpanded("Using Flex 3", Colors.red[600], 3),
              ],
            ),
          );
        },
      ),
    );
  }
}
