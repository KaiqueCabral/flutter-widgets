import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/InteractionModels/076_ignore-pointer/ignore-pointer.dart';
import 'package:flutter_widgets/widgets/Layout/001_safe-area/safe-area.dart';
import 'package:flutter_widgets/widgets/Layout/002_expanded/expanded.dart';
import 'package:flutter_widgets/widgets/Layout/003_wrap/wrap.dart';
import 'package:flutter_widgets/widgets/Layout/010_table/table.dart';
import 'package:flutter_widgets/widgets/Layout/012_sliver-list-grid/sliver-list-grid.dart';
import 'package:flutter_widgets/widgets/Layout/020_fitted-box/fitted-box.dart';
import 'package:flutter_widgets/widgets/Layout/021_layout-builder/layout-builder.dart';
import 'package:flutter_widgets/widgets/Layout/025_align/align.dart';
import 'package:flutter_widgets/widgets/Layout/026_positioned/positioned.dart';
import 'package:flutter_widgets/widgets/Layout/029_sized-box/sized-box.dart';
import 'package:flutter_widgets/widgets/Layout/033_flexible/flexible.dart';
import 'package:flutter_widgets/widgets/Layout/035_spacer/spacer.dart';
import 'package:flutter_widgets/widgets/Layout/038_aspect-ratio/aspect-ratio.dart';
import 'package:flutter_widgets/widgets/Layout/039_limited-box/limited-box.dart';
import 'package:flutter_widgets/widgets/Layout/046_indexed-stack/indexed-stack.dart';
import 'package:flutter_widgets/widgets/Layout/048_constrained-box/constrained-box.dart';
import 'package:flutter_widgets/widgets/Layout/049_stack/stack.dart';
import 'package:flutter_widgets/widgets/Layout/051_fractionally-sized-box/fractionally-sized-box.dart';
import 'package:flutter_widgets/widgets/Layout/052_list-view/list-view.dart';
import 'package:flutter_widgets/widgets/Layout/053_list-tile/list-tile.dart';
import 'package:flutter_widgets/widgets/Layout/054_container/container.dart';
import 'package:flutter_widgets/widgets/Layout/066_tab-bar/default-tab-controller.dart';
import 'package:flutter_widgets/widgets/Layout/069_list-wheel-scroll-view/list-wheel-scroll-view.dart';
import 'package:flutter_widgets/widgets/Layout/081_checkbox-list-tile/checkbox-list-tile.dart';
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
            child: getNavItem(Icons.view_carousel, "GO! GO! GO!",
                CheckboxListTilePage.routeName, context),
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
