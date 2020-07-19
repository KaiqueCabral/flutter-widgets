import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/settings.dart';

class CupertinoActivityIndicatorPage extends StatefulWidget {
  static const String routeName = "/cupertino-activity-indicator";

  @override
  _CupertinoActivityIndicatorPageState createState() =>
      _CupertinoActivityIndicatorPageState();
}

class _CupertinoActivityIndicatorPageState
    extends State<CupertinoActivityIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino Activity Indicator"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: CupertinoActivityIndicator(
                radius: 50,
                animating: true,
              ),
            ),
            Image.network(
              "${Settings.apiURL}/images/white-owl.jpg",
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              },
              semanticLabel: "Image of an owl from the internet",
            ),
            StreamBuilder<int>(
              stream: getNumber(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.data != null && snapshot.data > 0) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "${snapshot.data + 1}",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      snapshot.data + 1 == 100
                          ? Icon(
                              Icons.check_box,
                              color: Colors.green,
                            )
                          : CupertinoActivityIndicator(),
                    ],
                  );
                }
                return Container();
              },
            ),
          ],
        ),
        minimum: EdgeInsets.all(30),
      ),
    );
  }

  Stream<int> getNumber() {
    Duration interval = Duration(milliseconds: 50);
    Stream<int> stream = Stream<int>.periodic(interval, transform);
    stream = stream.take(100);

    return stream;
  }

  int transform(int value) {
    return value;
  }
}