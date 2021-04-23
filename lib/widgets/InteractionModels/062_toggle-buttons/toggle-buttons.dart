import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class ToggleButtonsPage extends StatefulWidget {
  static const String routeName = "/toggle-buttons";

  @override
  _ToggleButtonsPageState createState() => _ToggleButtonsPageState();
}

class _ToggleButtonsPageState extends State<ToggleButtonsPage> {
  List<Widget> lstIcons = <Widget>[
    Icon(Icons.folder_open),
    Icon(Icons.save),
    Icon(Icons.insert_drive_file),
  ];
  List<bool> lstIsSelectedMC = List.generate(3, (_) => false);
  List<bool> lstIsSelectedEC = List.generate(3, (_) => false);
  List<bool> lstIsSelectedECN = List.generate(3, (_) => false);
  List<bool> lstIsSelectedECO = List.generate(3, (index) => (index == 0));
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
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
        title: Text("Toggle Buttons"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Multiple Choices"),
                _toggleButtons(lstIcons, _onPressedMC, lstIsSelectedMC),
              ],
            ),
            _divider(Colors.blue),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Exclusive Choice"),
                _toggleButtons(lstIcons, _onPressedEC, lstIsSelectedEC),
              ],
            ),
            _divider(Colors.green),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Exclusive Choice - None allowed"),
                _toggleButtons(lstIcons, _onPressedECN, lstIsSelectedECN),
              ],
            ),
            _divider(Colors.red),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Multiple Choices - At Least One"),
                _toggleButtons(lstIcons, _onPressedECO, lstIsSelectedECO),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onPressedMC(int index) {
    setState(() {
      lstIsSelectedMC[index] = !lstIsSelectedMC[index];
    });
  }

  _onPressedEC(int index) {
    setState(() {
      _forExclusive(index, lstIsSelectedEC, false);
    });
  }

  _onPressedECN(int index) {
    setState(() {
      _forExclusive(index, lstIsSelectedECN, lstIsSelectedECN[index]);
    });
  }

  _onPressedECO(int index) {
    int count = 0;
    lstIsSelectedECO.forEach((bool isSelected) {
      if (isSelected) count++;
    });

    if (lstIsSelectedECO[index] && count < 2) {
      return;
    }

    setState(() {
      lstIsSelectedECO[index] = !lstIsSelectedECO[index];
    });
  }

  _forExclusive(int index, List<bool> lstIsSelected, bool isNoneAllowed) {
    for (int buttonIndex = 0;
        buttonIndex < lstIsSelected.length;
        buttonIndex++) {
      if (buttonIndex == index) {
        lstIsSelected[buttonIndex] = !isNoneAllowed;
      } else {
        lstIsSelected[buttonIndex] = false;
      }
    }
  }

  _toggleButtons(
    List<Widget> icons,
    Function(int) _onPressed,
    List<bool> lstIsSelected,
  ) =>
      ToggleButtons(
        children: icons,
        onPressed: _onPressed,
        isSelected: lstIsSelected,
      );

  _divider(Color _color) => Divider(
        color: _color,
        height: 40,
        thickness: 1,
      );
}
