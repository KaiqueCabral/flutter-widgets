import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CheckboxListTilePage extends StatefulWidget {
  static const String routeName = "/checkbox-list-tile";

  @override
  _CheckboxListTilePageState createState() => _CheckboxListTilePageState();
}

class _CheckboxListTilePageState extends State<CheckboxListTilePage> {
  BannerAd _ad;

  @override
  void initState() {
    super.initState();

    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.fullBanner,
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

  bool _backup = false;
  bool _upload = false;
  bool _update = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox List Tile"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 55),
        children: [
          CheckboxListTile(
            value: _backup,
            onChanged: (value) => setState(() => _backup = !_backup),
            activeColor: Colors.red[100],
            checkColor: Colors.grey[800],
            controlAffinity: ListTileControlAffinity.leading,
            secondary: Icon(Icons.backup),
            title: Text("Backup?"),
          ),
          CheckboxListTile(
            value: _upload,
            onChanged: (value) => setState(() => _upload = !_upload),
            activeColor: Colors.green[300],
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.trailing,
            secondary: Icon(Icons.cloud_upload),
            title: Text("Upload?"),
          ),
          CheckboxListTile(
            value: _update,
            onChanged: (value) => setState(() => _update = !_update),
            controlAffinity: ListTileControlAffinity.platform,
            secondary: Icon(Icons.refresh),
            title: Text("Update?"),
          ),
        ],
      ),
    );
  }
}
