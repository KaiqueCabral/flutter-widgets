import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class ShaderMaskPage extends StatefulWidget {
  static const String routeName = "/shader-mask";

  @override
  _ShaderMaskPageState createState() => _ShaderMaskPageState();
}

class _ShaderMaskPageState extends State<ShaderMaskPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
    //..load()
    //..show();
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
        title: Text("Shader Mask"),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return (index < 9)
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: listShaderItem(
                    index,
                    Text(
                      'Item ${(index + 1).toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : listShaderItem(
                  index,
                  Container(
                    alignment: Alignment.center,
                    color: Colors.amber,
                    height: 30,
                    width: 200,
                    margin: EdgeInsets.all(10),
                  ),
                );
        },
      ),
    );
  }

  Widget listShaderItem(int index, Widget widgetChild) => ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect bounds) {
          return RadialGradient(
            center: Alignment.topLeft,
            radius: 2.0,
            colors: <Color>[
              Colors.yellow,
              Colors.deepOrange.shade100,
              Colors.deepOrange.shade300,
              Colors.deepOrange.shade500,
              Colors.deepOrange.shade700,
              Colors.deepOrange.shade900,
            ],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: Center(
          child: widgetChild,
        ),
      );
}
