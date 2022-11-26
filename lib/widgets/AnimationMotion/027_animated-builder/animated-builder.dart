import 'package:flutter/foundation.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  static const String routeName = "/animated-builder";

  _AnimatedBuilderPage createState() => _AnimatedBuilderPage();
}

class _AnimatedBuilderPage extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  BannerAd? _ad;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      reverseDuration: Duration(seconds: 2),
      upperBound: 2,
    )..repeat(reverse: true);

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
    _controller.dispose();
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Builder"),
      ),
      bottomSheet: (!kIsWeb)
          ? Container(
              child: AdWidget(ad: _ad!),
              width: MediaQuery.of(context).size.width,
              height: _ad!.size.height.toDouble(),
            )
          : Container(
              height: 0,
              width: 0,
            ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * 3.1415,
              child: child,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Animted\nBuilder',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
