import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TablePage extends StatefulWidget {
  static const String routeName = "/table";

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
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

  Widget fittedBox(Color _bgColor) => FittedBox(
        fit: BoxFit.contain,
        child: Container(
          color: _bgColor,
          padding: EdgeInsets.all(20),
          child: Text(
            "COLUNA 1",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget tableCell(double _height) => TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          //color: _color,
          height: _height,
          padding: EdgeInsets.all(20),
          alignment: Alignment.topCenter,
          decoration: FlutterLogoDecoration(
            style: FlutterLogoStyle.horizontal,
            textColor: Colors.black45,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: Container(
        child: Table(
          border: TableBorder(
            horizontalInside: BorderSide(
              width: 3,
              color: Colors.brown,
              style: BorderStyle.solid,
            ),
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {
            0: FractionColumnWidth(0.25),
            1: FractionColumnWidth(0.25),
            2: FractionColumnWidth(0.50),
          },
          children: <TableRow>[
            TableRow(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              children: <Widget>[
                fittedBox(Colors.yellow),
                fittedBox(Colors.teal),
                fittedBox(Colors.grey),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(
                color: Colors.black,
                backgroundBlendMode: BlendMode.colorDodge,
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.yellowAccent,
                    Colors.orange,
                    Colors.red,
                  ],
                ),
              ),
              children: <Widget>[
                tableCell(100),
                tableCell(150),
                tableCell(200),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
