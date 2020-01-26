import 'package:flutter/material.dart';

class DismissiblePage extends StatefulWidget {
  static const String routeName = "/dismissible";

  _DismissiblePage createState() => _DismissiblePage();
}

class _DismissiblePage extends State<DismissiblePage> {
  final _items = List<String>.generate(20, (i) => "Item ${i + 1}");
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];

          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.red[100],
            ),
            secondaryBackground: Container(
              color: Colors.green,
            ),
            child: ListTile(
              title: Text("$item"),
            ),
            onDismissed: (direction) {
              setState(
                () {
                  if (direction == DismissDirection.startToEnd) {
                    _text = " (Removed)";
                    _items.removeAt(index);
                  } else if (direction == DismissDirection.endToStart) {
                    _items[index] += " Confirmed";
                    _text = " (Confirmed)";
                  }

                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "$item $_text",
                      ),
                      duration: Duration(
                        seconds: 1,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
