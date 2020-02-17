import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  static const String routeName = "/alert-dialog";

  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  String _text = "";
  simpleDialog(BuildContext context) {
    AlertDialog _dialog = AlertDialog(
      content: Text("You can just click on the \"OK\" button."),
      actions: <Widget>[
        RaisedButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _dialog;
      },
    );
  }

  twoButtonsDialog(BuildContext context) {
    AlertDialog _dialog = AlertDialog(
      title: Text("Alert Dialog"),
      content: Text("You can just click on the \"OK\" button or \"Cancel\"."),
      actions: <Widget>[
        RaisedButton(
          child: Text("OK"),
          onPressed: () {
            setState(() {
              _text = "Testing the button \"OK\".";
            });
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _dialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Container(
        color: Colors.yellow[100],
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: Text("Normal Alert Dialog"),
              onPressed: () {
                simpleDialog(context);
              },
            ),
            Text(_text),
            RaisedButton(
              child: Text("Alert Dialog with Two Buttons"),
              onPressed: () {
                twoButtonsDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}