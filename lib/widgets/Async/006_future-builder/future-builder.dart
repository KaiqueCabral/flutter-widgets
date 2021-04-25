import 'package:flutter/material.dart';
import 'package:flutter_widgets/model/future-builder.dart';
import 'package:flutter_widgets/services/future-builder.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FutureBuilderPage extends StatefulWidget {
  static const String routeName = "/future-builder";

  FutureBuilderPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FutureBuilderPage createState() => _FutureBuilderPage();
}

class _FutureBuilderPage extends State<FutureBuilderPage> {
  int _post = 1;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            child: AdWidget(ad: _ad),
            height: _ad.size.height.toDouble(),
            margin: const EdgeInsets.only(top: 10),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).orientation == Orientation.portrait
                    ? 70
                    : 10,
                bottom:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 70
                        : 10,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FutureBuilder<FutureBuilderModel>(
                      future: getFutureResponse(_post),
                      builder: (context, snapshot) {
                        List<Widget> children;

                        switch (snapshot.connectionState) {
                          case ConnectionState.done:
                            if (snapshot.hasData) {
                              children = <Widget>[
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green,
                                  size: 60,
                                ),
                                SafeArea(
                                  minimum: EdgeInsets.all(20),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          postInfo("ID: ${snapshot.data.id}"),
                                          postInfo(
                                              "User ID: ${snapshot.data.userId}"),
                                        ],
                                      ),
                                      Divider(),
                                      Container(
                                        child: Text(
                                          'Title: ${snapshot.data.title}',
                                          style: TextStyle(fontSize: 24),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Divider(),
                                      Container(
                                        child: Text(
                                          'Body: ${snapshot.data.body} ${snapshot.data.body}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ];
                            } else if (snapshot.hasError) {
                              children = <Widget>[
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text('Error: ${snapshot.error}'),
                                ),
                              ];
                            }
                            break;
                          default:
                            children = <Widget>[
                              SizedBox(
                                child: CircularProgressIndicator(),
                                width: 60,
                                height: 60,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text('Awaiting result...'),
                              ),
                            ];
                            break;
                        }

                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: children,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _post++;
          });
        },
        label: Text("Click here!"),
        icon: Icon(
          Icons.touch_app,
          color: Colors.white,
        ),
      ),
    );
  }

  postInfo(String text) => Expanded(
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18),
        ),
      );
}
