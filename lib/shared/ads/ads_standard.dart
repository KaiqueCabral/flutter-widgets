import 'package:firebase_admob/firebase_admob.dart';

class AdsStandard {
  AdsStandard() {
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
  }

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    //testDevices: <String>["testDevice"],
    keywords: <String>[
      'Flutter',
      'Widgets',
      'Programming',
      'Developer',
      'Code',
      'Programmer',
      'Mobile',
      'Application',
    ],
    contentUrl: 'https://github.com/kaiquecabral/',
    childDirected: true,
    nonPersonalizedAds: false,
  );

  BannerAd createBannerAd(AdSize adSize) {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: adSize,
      targetingInfo: targetingInfo,
      // listener: (MobileAdEvent event) {
      //   print("BannerAd event $event");
      // },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      // listener: (MobileAdEvent event) {
      //   print("InterstitialAd event $event");
      // },
    );
  }

  NativeAd createNativeAd() {
    return NativeAd(
      adUnitId: NativeAd.testAdUnitId,
      factoryId: 'adFactoryExample',
      targetingInfo: targetingInfo,
      // listener: (MobileAdEvent event) {
      //   print("$NativeAd event $event");
      // },
    );
  }
}
