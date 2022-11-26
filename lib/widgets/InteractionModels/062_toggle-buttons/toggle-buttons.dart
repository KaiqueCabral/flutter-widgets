import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
  BannerAd? _ad;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      _ad = BannerAd(
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.fullBanner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
      );

      _ad?.load();
    }
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
        title: Text("Toggle Buttons"),
      ),
      bottomSheet: (!kIsWeb)
          ? Container(
              child: AdWidget(ad: _ad!),
              height: _ad!.size.height.toDouble(),
            )
          : Container(
              height: 0,
              width: 0,
            ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 65, left: 30, right: 30, top: 30),
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
