//import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class AdsAdmob {
  final GlobalKey<ScaffoldState> scaffoldState;
  AdsAdmob({this.scaffoldState});

  void showSnackBar(String content) {
    scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text(content),
      duration: Duration(milliseconds: 1500),
    ));
  }

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
        showSnackBar('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
        showSnackBar('Admob $adType Ad opened!');
        break;
      case AdmobAdEvent.closed:
        showSnackBar('Admob $adType Ad closed!');
        break;
      case AdmobAdEvent.failedToLoad:
        showSnackBar('Admob $adType failed to load. :(');
        break;
      case AdmobAdEvent.rewarded:
        showDialog(
          context: scaffoldState.currentContext,
          builder: (BuildContext context) {
            return WillPopScope(
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Reward callback fired. Thanks Andrew!'),
                    Text('Type: ${args['type']}'),
                    Text('Amount: ${args['amount']}'),
                  ],
                ),
              ),
              onWillPop: () async {
                scaffoldState.currentState.hideCurrentSnackBar();
                return true;
              },
            );
          },
        );
        break;
      default:
    }
  }

  /*
  Test Id's from:
  https://developers.google.com/admob/ios/banner
  https://developers.google.com/admob/android/banner

  App Id
  Android: ca-app-pub-3940256099942544~3347511713
  iOS: ca-app-pub-3940256099942544~1458002511

  Banner
  Android: ca-app-pub-3940256099942544/6300978111
  iOS: ca-app-pub-3940256099942544/2934735716

  Interstitial
  Android: ca-app-pub-3940256099942544/1033173712
  iOS: ca-app-pub-3940256099942544/4411468910

  Reward Video
  Android: ca-app-pub-3940256099942544/5224354917
  iOS: ca-app-pub-3940256099942544/1712485313
  */

  static String getAppId() {
    // if (Platform.isIOS) {
    //   return 'ca-app-pub-3940256099942544~1458002511';
    // } else if (Platform.isAndroid) {
    return 'ca-app-pub-1321326322955945~2669270764';
    // }
    // return null;
  }

  static String getBannerAdUnitId() {
    // if (Platform.isIOS) {
    //   return 'ca-app-pub-3940256099942544/2934735716';
    // } else if (Platform.isAndroid) {
    //TODO: Change the ID for ca-app-pub-1321326322955945/2091805820
    return 'ca-app-pub-3940256099942544/6300978111';
    // }
    // return null;
  }

  static String getInterstitialAdUnitId() {
    // if (Platform.isIOS) {
    //   return 'ca-app-pub-3940256099942544/4411468910';
    // } else if (Platform.isAndroid) {
    return 'ca-app-pub-1321326322955945/7638526414';
    // }
    // return null;
  }

  static String getRewardBasedVideoAdUnitId() {
    // if (Platform.isIOS) {
    //   return 'ca-app-pub-3940256099942544/1712485313';
    // } else if (Platform.isAndroid) {
    return 'ca-app-pub-1321326322955945/5112188007';
    // }
    // return null;
  }
}
