import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SwitchListTilePage extends StatefulWidget {
  static const String routeName = "/switch-list-tile";

  @override
  _SwitchListTilePageState createState() => _SwitchListTilePageState();
}

class _SwitchListTilePageState extends State<SwitchListTilePage> {
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

  bool _lights = false;
  bool _selectAll = false;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch List Tile"),
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
      body: ListView(
        children: [
          SwitchListTile(
            title: Text("Select All"),
            onChanged: (bool value) => setState(() {
              _selectAll = value;
              _darkMode = value;
              _lights = value;
            }),
            value: _selectAll,
          ),
          SwitchListTile(
            title: const Text("Lights"),
            value: _lights,
            subtitle: Text("Click to turn on the lights"),
            activeColor: Colors.amber,
            onChanged: (bool value) {
              setState(() {
                _lights = value;
              });
            },
            secondary: Icon(
              _lights ? Icons.lightbulb : Icons.lightbulb_outline,
              color: _lights ? Colors.amber : Colors.grey,
            ),
          ),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: _darkMode,
            subtitle: Text("Click to turn on Dark Mode"),
            onChanged: (bool value) {
              setState(() {
                _darkMode = value;
              });
            },
            secondary: Icon(
              _darkMode ? Icons.brightness_2 : Icons.brightness_2_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
