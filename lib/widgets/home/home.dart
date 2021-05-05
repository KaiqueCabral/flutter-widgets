import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/Scrolling/071_notification-listener/notification-listener.dart';
import 'package:flutter_widgets/widgets/home/menu-items.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    MobileAds.instance.initialize();
  }

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
          Container(
            child: getNavItem(
              Icons.view_carousel,
              "GO! GO! GO!",
              NotificationListenerPage.routeName,
              context,
            ),
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
        ],
      ),
    );
  }

  ListTile getNavItem(
      IconData icon, String title, String routeName, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
      leading: Icon(
        icon,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey[900],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
