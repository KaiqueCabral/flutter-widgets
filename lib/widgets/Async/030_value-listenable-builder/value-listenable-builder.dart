import 'package:flutter/material.dart';

class ValueListenableBuilderPage extends StatefulWidget {
  static const String routeName = "/value-listenable-builder";

  ValueListenableBuilderPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ValueListenableBuilderPage createState() => _ValueListenableBuilderPage();
}

class _ValueListenableBuilderPage extends State<ValueListenableBuilderPage> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final Widget _text = const Text("ValueListenableBuilder!");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have pushed the button this many times:"),
            ValueListenableBuilder(
              builder: (BuildContext context, int value, Widget child) {
                // This builder will only get called when the _counter
                // is updated.
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("$value"),
                    SizedBox(
                      height: 30,
                    ),
                    child,
                  ],
                );
              },
              valueListenable: _counter,
              // The child parameter is most helpful if the child is
              // expensive to build and does not depend on the value from
              // the notifier.
              child: _text,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}
