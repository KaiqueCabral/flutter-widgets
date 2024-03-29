import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FloatingActionButtonPage extends StatefulWidget {
  static const String routeName = "/floating-action-button";

  @override
  _FloatingActionButtonPage createState() => _FloatingActionButtonPage();
}

class _FloatingActionButtonPage extends State<FloatingActionButtonPage>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<Color?> _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  String _text = "Testing Floating Action Button";
  BannerAd? _ad;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1.00, curve: _curve),
      ),
    );
    _translateButton = Tween<double>(begin: _fabHeight, end: -14.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.75, curve: _curve),
      ),
    );

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
    _animationController.dispose();
    _ad?.dispose();
    super.dispose();
  }

  animate() {
    _text = "Testing Floating Action Button";
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    isOpened = !isOpened;
  }

  Widget add() {
    return new Container(
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            _text = "Add";
          });
        },
        tooltip: "Add",
        heroTag: "btnAdd",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget image() {
    return new Container(
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            _text = "Image";
          });
        },
        tooltip: "Image",
        heroTag: "btnImage",
        child: Icon(Icons.image),
      ),
    );
  }

  Widget inbox() {
    return new Container(
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            _text = "Inbox";
          });
        },
        tooltip: "Inbox",
        heroTag: "btnInbox",
        child: Icon(Icons.inbox),
      ),
    );
  }

  Widget toggle() {
    return FloatingActionButton(
      backgroundColor: _buttonColor.value,
      onPressed: animate,
      tooltip: "Toggle",
      heroTag: "btnToggle",
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animateIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Action Button"),
      ),
      body: Column(
        children: [
          Container(
            child: AdWidget(ad: _ad!),
            height: _ad!.size.height.toDouble(),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(_text),
                  alignment: Alignment.center,
                  color: Colors.grey,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width / 4.0,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Click here! >>> ",
                      style: TextStyle(fontSize: 24, color: Colors.grey),
                    ),
                    padding: EdgeInsets.all(25),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 3.0, 0.0),
            child: add(),
          ),
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 2.0, 0.0),
            child: image(),
          ),
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 1.0, 0.0),
            child: inbox(),
          ),
          toggle()
        ],
      ),
    );
  }
}
