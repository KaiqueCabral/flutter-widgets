import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  static const String routeName = "/table";
  //The part inside of the FB will just fit
  //For example, as you can see, the FONTSIZE ajust according to the FittedBox
  Widget fittedBox(Color _bgColor) => FittedBox(
        fit: BoxFit.contain,
        child: Container(
          color: _bgColor,
          padding: EdgeInsets.all(20),
          child: Text(
            "COLUNA 1",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  //TableCell you can define the height, fontSize and other properties
  Widget tableCell(double _height) => TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          //color: _color,
          height: _height,
          padding: EdgeInsets.all(20),
          alignment: Alignment.topCenter,
          decoration: FlutterLogoDecoration(
            darkColor: Colors.blue,
            lightColor: Colors.blueAccent,
            style: FlutterLogoStyle.horizontal,
            textColor: Colors.black45,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table"),
      ),
      body: Container(
        child: Table(
          border: TableBorder(
            horizontalInside: BorderSide(
              width: 3,
              color: Colors.brown,
              style: BorderStyle.solid,
            ),
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {
            0: FractionColumnWidth(0.25),
            1: FractionColumnWidth(0.25),
            2: FractionColumnWidth(0.50),
          },
          children: <TableRow>[
            TableRow(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              children: <Widget>[
                fittedBox(Colors.yellow),
                fittedBox(Colors.teal),
                fittedBox(Colors.grey),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(
                color: Colors.black,
                backgroundBlendMode: BlendMode.colorDodge,
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.yellowAccent,
                    Colors.orange,
                    Colors.red,
                  ],
                ),
              ),
              children: <Widget>[
                tableCell(100),
                tableCell(150),
                tableCell(200),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
