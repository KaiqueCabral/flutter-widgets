import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_admob.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/home/menu-items.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MenuItems(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.arrow_upward,
                  size: 55,
                  color: Colors.red[600],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Use the menu to check the widgets",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Text(
                  "If my code or my app helped you somehow, feel free to buy me a coffee. :)",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () => Menu.launchInWebViewOrVC(
                      "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=X5FNNUEWVNALQ&source=url"),
                  child: Image.network(
                    "https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif",
                  ),
                ),
              ),
              Text(
                "Thank you!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          MediaQuery.of(context).orientation == Orientation.portrait
              ? AdmobBanner(
                  adUnitId: AdsAdmob.getBannerAdUnitId(),
                  adSize: AdmobBannerSize.BANNER,
                )
              : Container(),
        ],
      ),
    );
  }
}
