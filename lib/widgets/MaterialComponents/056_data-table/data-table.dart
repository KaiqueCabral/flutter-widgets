import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DataTablePage extends StatefulWidget {
  static const String routeName = "/data-table";

  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
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

  _dataColumn(String _nameColumn, bool _isNumeric) => DataColumn(
        label: Text(
          _nameColumn,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        numeric: _isNumeric,
      );

  _dataRow(int _id, String _name, int _age, String _sex) => DataRow(
        selected: true,
        cells: [
          DataCell(
            Text(
              _id.toString(),
              style: TextStyle(fontSize: 14),
            ),
          ),
          DataCell(
            Text(
              _name,
              style: TextStyle(fontSize: 14),
            ),
          ),
          DataCell(
            Text(
              _age.toString(),
              style: TextStyle(fontSize: 14),
            ),
          ),
          DataCell(
            Text(
              _sex,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Table"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: Container(
        color: Colors.teal[200],
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 55),
          child: DataTable(
            dividerThickness: 1,
            sortAscending: true,
            sortColumnIndex: 0,
            horizontalMargin: 0,
            columns: [
              _dataColumn("ID", true),
              _dataColumn("Name", false),
              _dataColumn("Age", true),
              _dataColumn("Sex", false),
            ],
            rows: [
              _dataRow(1, "Kaique", 26, "Male"),
              _dataRow(2, "John", 24, "Male"),
              _dataRow(3, "Pam", 30, "Female"),
              _dataRow(4, "David", 25, "Male"),
              _dataRow(5, "Michael", 18, "Male"),
              _dataRow(6, "Evelyn", 36, "Female"),
              _dataRow(7, "Jake", 43, "Male"),
              _dataRow(8, "Amy", 20, "Female"),
              _dataRow(9, "Marta", 21, "Female"),
              _dataRow(10, "James", 28, "Male"),
              _dataRow(11, "Kaique", 26, "Male"),
              _dataRow(12, "John", 24, "Male"),
              _dataRow(13, "Pam", 30, "Female"),
              _dataRow(14, "David", 25, "Male"),
              _dataRow(15, "Michael", 18, "Male"),
              _dataRow(16, "Evelyn", 36, "Female"),
              _dataRow(17, "Jake", 43, "Male"),
              _dataRow(18, "Amy", 20, "Female"),
              _dataRow(19, "Marta", 21, "Female"),
              _dataRow(20, "James", 28, "Male"),
            ],
          ),
        ),
      ),
    );
  }
}
