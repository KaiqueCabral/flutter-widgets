import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class AnimatedWidgetPage extends StatefulWidget {
  static const String routeName = "/animated-widget";

  @override
  _AnimatedWidgetPageState createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
      ..load()
      ..show();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Widget"),
      ),
      body: Center(
        child: ScaleContainer(
          controller: _controller,
        ),
      ),
    );
  }
}

class ScaleContainer extends AnimatedWidget {
  const ScaleContainer({Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _progress.value,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
      ),
    );
  }
}
