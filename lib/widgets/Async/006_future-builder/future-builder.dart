import 'package:flutter/material.dart';
import 'package:widget_tests/model/future-builder.dart';
import 'package:widget_tests/services/future-builder.dart';

class FutureBuilderPage extends StatefulWidget {
  static const String routeName = "/future-builder";

  FutureBuilderPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FutureBuilderPage createState() => _FutureBuilderPage();
}

class _FutureBuilderPage extends State<FutureBuilderPage> {
  int _post = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<FutureBuilderModel>(
                future: getFutureResponse(_post),
                builder: (context, snapshot) {
                  List<Widget> children;

                  if (snapshot.hasData) {
                    children = <Widget>[
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 60,
                      ),
                      SafeArea(
                        minimum: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'ID: ${snapshot.data.id}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'User ID: ${snapshot.data.userId}',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Container(
                              child: Text(
                                'Title: ${snapshot.data.title}',
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Divider(),
                            Container(
                              child: Text(
                                'Body: ${snapshot.data.body}',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ];
                  } else if (snapshot.hasError) {
                    children = <Widget>[
                      Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      ),
                    ];
                  } else {
                    children = <Widget>[
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      ),
                    ];
                  }

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: children,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _post++;
          });
        },
        label: Text("Click here!"),
        icon: Icon(
          Icons.touch_app,
          color: Colors.white,
        ),
      ),
    );
  }
}
