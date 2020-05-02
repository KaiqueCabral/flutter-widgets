import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu {
  final Color colorItems;
  Menu({this.colorItems});

  static ExpansionTile getMenu(
      IconData icon, String title, Color color, List<Widget> subItems) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(color: color, fontSize: 16.0),
      ),
      leading: Icon(
        icon,
        color: color,
      ),
      children: subItems,
    );
  }

  ListTile getNavItem(
      IconData icon, String title, String routeName, BuildContext context) {
    var colorItem =
        colorItems != null ? colorItems : Theme.of(context).primaryColor;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
      leading: Icon(
        icon,
        color: colorItem,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey[900],
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  static DrawerHeader appDrawerHeader() {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Check the code:",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          InkWell(
            onTap: () => Menu.launchInWebViewOrVC(
              "https://github.com/kaiquecabral/flutter-widgets",
            ),
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Image.asset(
                  "assets/images/GitHub_Logo.png",
                  width: 100,
                  color: Colors.white,
                ),
                Text(
                  "https://github.com/kaiquecabral/flutter-widgets",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue[900],
            Colors.blue[700],
            Colors.blue,
            Colors.blue[400],
            Colors.blue[300],
          ],
        ),
      ),
    );
  }

  static AboutListTile appAbout() {
    return AboutListTile(
      child: Text("About"),
      applicationName: "Flutter Widgets",
      aboutBoxChildren: <Widget>[
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "App based on \"Widgets of the week\" from ",
              ),
              TextSpan(
                text: "Flutter Channel (YouTube)",
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchInWebViewOrVC(
                        "https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG",
                      ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
              TextSpan(text: "."),
            ],
          ),
        ),
      ],
      applicationVersion: "v1.0.0",
      applicationIcon: Icon(
        Icons.widgets,
        size: 20,
      ),
      icon: Icon(Icons.info),
    );
  }

  static Future<void> launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw "Could not launch $url";
    }
  }
}
