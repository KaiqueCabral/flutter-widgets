import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class SnackBarPage extends StatefulWidget {
  static const String routeName = "/snackbar";

  @override
  _SnackBarPageState createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //bannerAd = AdsStandard().createBannerAd(AdSize.banner)
    //..load()
    //..show(anchorType: AnchorType.top, anchorOffset: 90);
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
        title: Text("SnackBar"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SnackBar cannot be inside a Scaffold.\nThe Widget needs to be inherited by a Scaffold.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: Colors.green[200],
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    containerExplained(
                      "Widget with scaffold",
                      Colors.blue[500],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    containerExplained(
                      "Widget with\nbutton to activate\nthe SnackBar",
                      Colors.blue[200],
                    ),
                    containerExplained(
                      "Widget with\nbutton to activate\nthe SnackBar",
                      Colors.blue[200],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Click in one of the buttons below to show the SnackBar.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RowWithIcons(),
        ],
      ),
    );
  }
}

containerExplained(String message, Color color) => Container(
      margin: EdgeInsets.all(10.0),
      color: color,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );

class RowWithIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TextButton.icon(
          onPressed: () {
            snackBarMessage(
                context, Icons.directions_bike, Colors.amber[100], "Bike");
          },
          icon: Icon(Icons.directions_bike),
          label: Text("Bike"),
          style: TextButton.styleFrom(
            backgroundColor: Colors.amber[100],
          ),
        ),
        TextButton.icon(
          onPressed: () {
            snackBarMessage(
                context, Icons.directions_bus, Colors.teal[100], "Bus");
          },
          icon: Icon(Icons.directions_bus),
          label: Text("Bus"),
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal[100],
          ),
        ),
        TextButton.icon(
          onPressed: () {
            snackBarMessage(
                context, Icons.directions_car, Colors.indigo[100], "Car");
          },
          icon: Icon(Icons.directions_car),
          label: Text("Car"),
          style: TextButton.styleFrom(
            backgroundColor: Colors.indigo[100],
          ),
        ),
      ],
    );
  }

  void snackBarMessage(
      BuildContext context, IconData icon, Color color, String transport) {
    final snackBar = SnackBar(
      backgroundColor: color,
      duration: Duration(seconds: 2),
      content: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black87,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Great! You are going by $transport.",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );

    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
