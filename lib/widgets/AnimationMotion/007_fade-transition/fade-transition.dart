import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class FadeTransitionPage extends StatefulWidget {
  static const String routeName = "/fade-transition";

  @override
  _FadeTransitionPage createState() => _FadeTransitionPage();
}

class _FadeTransitionPage extends State<FadeTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  CurvedAnimation _curvedAnimation;
  BannerAd _ad;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_curvedAnimation);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.largeBanner,
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
    _animationController.dispose();
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fade Transition'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: AdWidget(ad: _ad),
              width: MediaQuery.of(context).size.width,
              height: _ad.size.height.toDouble(),
              margin: EdgeInsets.only(bottom: isPortrait ? 50 : 0),
            ),
            FadeTransition(
              opacity: _animation,
              child: Icon(
                Icons.lightbulb_outline,
                color: Colors.lightGreen,
                size: isPortrait ? 300 : 90,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          setState(() {
            _animationController.reset();
            _animationController.forward();
          });
        },
        icon: Icon(
          Icons.movie_filter,
          color: Colors.white,
        ),
        label: Text(
          "Animate",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
