import 'dart:math' as math;
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class InheritedModelPage extends StatefulWidget {
  static const String routeName = "/inherited-model";

  _InheritedModelPage createState() => _InheritedModelPage();
}

class _InheritedModelPage extends State<InheritedModelPage> {
  Color _colorOne = Colors.brown;
  Color _colorTwo = Colors.green;
  int _count = 0;
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.mediumRectangle)
      ..load()
      ..show(anchorOffset: 20);
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
        title: Text("Inherited Model"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AncestorModelWidget(
              _colorOne,
              _colorTwo,
              _count,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FirstDependent(),
                  SecondDependent(),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      child: Text("Change FIRST"),
                      onPressed: () {
                        setState(() {
                          _colorOne = Color(
                                  (math.Random().nextDouble() * 0xFFFFFF)
                                          .toInt() <<
                                      0)
                              .withOpacity(1.0);
                          _count++;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      child: Text("Change SECOND"),
                      onPressed: () {
                        setState(() {
                          _colorTwo = Color(
                                  (math.Random().nextDouble() * 0xFFFFFF)
                                          .toInt() <<
                                      0)
                              .withOpacity(1.0);
                          _count++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AncestorModelWidget extends InheritedModel<String> {
  final Color colorOne;
  final Color colorTwo;
  final int count;

  const AncestorModelWidget(
      this.colorOne, this.colorTwo, this.count, Widget child)
      : super(child: child);

  static AncestorModelWidget of(BuildContext context, String aspects) {
    return InheritedModel.inheritFrom(context, aspect: aspects);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    print("updateShouldNotify");
    return true;
  }

  @override
  bool updateShouldNotifyDependent(
      AncestorModelWidget oldWidget, Set<String> dependencies) {
    print("updateShouldNotifyDependent");
    if (dependencies.contains('one') && colorOne != oldWidget.colorOne) {
      print("Only widget one is rebuild");
      return true;
    }

    if (dependencies.contains('two') && colorTwo != oldWidget.colorTwo) {
      print("Only widget two is rebuild");
      return true;
    }
    return false;
  }
}

class FirstDependent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancestor = AncestorModelWidget.of(context, 'one');
    print("First");

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Text("Child 1\nNumber of clicks: ${ancestor.count}"),
        color: ancestor.colorOne,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class SecondDependent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancestor = AncestorModelWidget.of(context, 'two');
    //AncestorModelWidget.of(context, 'two');
    print("Second");

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Text("Child 2\nNumber of clicks: ${ancestor.count}"),
        color: ancestor.colorTwo,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
