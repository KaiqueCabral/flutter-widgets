import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ReordenableListViewPage extends StatefulWidget {
  static const String routeName = "/reordenable-list-view";

  _ReordenableListViewPage createState() => _ReordenableListViewPage();
}

class _ReordenableListViewPage extends State<ReordenableListViewPage> {
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

  List<Cars> _cars = <Cars>[
    Cars(1, "Ford", "New Fiesta", Colors.white),
    Cars(2, "Fiat", "500", Colors.red),
    Cars(3, "Chevrolet", "Camaro", Colors.yellow),
    Cars(4, "Toyota", "Corolla", Colors.grey[500]!),
    Cars(5, "VW", "Jetta", Colors.black),
    Cars(6, "Ford", "Focus", Colors.white),
    Cars(7, "Fiat", "Uno", Colors.red),
    Cars(8, "Chevrolet", "Malibu", Colors.yellow),
    Cars(9, "Toyota", "Yaris", Colors.grey[500]!),
    Cars(10, "VW", "Beetle", Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reordenable List View"),
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
        color: Colors.orange[100],
        child: ReorderableListView(
          header: Container(
            color: Colors.orange,
            child: Text(
              "List of Cars",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
                fontFamily: "Arial",
              ),
            ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
          ),
          children: List.generate(_cars.length, (index) {
            return ListTile(
              onTap: () {},
              key: ValueKey("value$index"),
              leading: CircleAvatar(
                backgroundColor: _cars[index].color,
              ),
              title: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "ID: ",
                    ),
                    TextSpan(
                      text: _cars[index].id.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                _cars[index].model,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            );
          }),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              _updateItems(oldIndex, newIndex);
            });
          },
        ),
      ),
    );
  }

  void _updateItems(int _oldIndex, int _newIndex) {
    if (_newIndex > _oldIndex) {
      _newIndex -= 1;
    }

    final Cars _theCar = _cars.removeAt(_oldIndex);
    _cars.insert(_newIndex, _theCar);
  }
}

class Cars {
  int id;
  String maker;
  String model;
  Color color;

  Cars(this.id, this.maker, this.model, this.color);
}
