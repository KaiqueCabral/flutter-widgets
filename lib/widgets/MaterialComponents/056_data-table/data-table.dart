import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_admob.dart';

class DataTablePage extends StatefulWidget {
  static const String routeName = "/data-table";

  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobBannerSize bannerSize;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Admob.initialize(AdsAdmob.getAppId());
    bannerSize = AdmobBannerSize.BANNER;
  }

  _dataColumn(String _nameColumn, bool _isNumeric) => DataColumn(
        label: Text(
          _nameColumn,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        numeric: _isNumeric,
      );

  _dataRow(int _id, String _name, int _age, String _sex) => DataRow(
        selected: true,
        cells: [
          DataCell(
            Text(_id.toString()),
          ),
          DataCell(
            Text(_name),
          ),
          DataCell(
            Text(_age.toString()),
          ),
          DataCell(
            Text(_sex),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text("Data Table"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.grey[200],
                width: MediaQuery.of(context).size.width,
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
          ),
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: AdmobBanner(
              adUnitId: AdsAdmob.getBannerAdUnitId(),
              adSize: bannerSize,
            ),
          ),
        ],
      ),
    );
  }
}
