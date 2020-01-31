import 'dart:math';
import 'package:flutter/material.dart';

class Item {
  Item({this.name});
  String name;
}

class AnimatedListPage extends StatefulWidget {
  static const String routeName = "/animated-list";

  _AnimatedListPage createState() => _AnimatedListPage();
}

class _AnimatedListPage extends State<AnimatedListPage> {
  List<Item> items = new List();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  var rng = new Random();

  Widget _itHasNoData() {
    if (items.length == 0) {
      return Container(
        alignment: Alignment.topCenter,
        color: Colors.red[50],
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Text(
          "There is no data to show.",
          style: TextStyle(
            color: Colors.grey[900],
          ),
        ),
      );
    }
    return Container();
  }

  _addItem() {
    setState(() {
      listKey.currentState.insertItem(
        items.length,
        duration: const Duration(milliseconds: 500),
      );
      int id = rng.nextInt(50);
      items.add(new Item(name: "New Item $id"));
    });
  }

  _removeItem() {
    setState(() {
      if (items != null && items.length > 0) {
        int index = items.length - 1;
        listKey.currentState.removeItem(
          index,
          (context, animation) => buildItem(context, 0, animation),
          duration: const Duration(milliseconds: 250),
        );
        items.removeAt(index);
      }
    });
  }

  Widget buildItem(
      BuildContext context, int index, Animation<double> animation) {
    if (items.length > 0) {
      return SizeTransition(
        key: ValueKey<int>(index),
        axis: Axis.vertical,
        sizeFactor: animation,
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 20, right: 20),
          title: Container(
            padding: EdgeInsets.all(20),
            child: Text('${items[index].name}'),
            decoration: BoxDecoration(
              color: Colors.green[100],
              border: Border(
                bottom: BorderSide(
                  color: Colors.green[500],
                  width: 1,
                  style: BorderStyle.solid,
                ),
                top: BorderSide(
                  color: Colors.green[500],
                  width: 1,
                  style: BorderStyle.solid,
                ),
                right: BorderSide(
                  color: Colors.green[500],
                  width: 1,
                  style: BorderStyle.solid,
                ),
                left: BorderSide(
                  color: Colors.green[900],
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    //final Map<int, Animation<double>> animations = <int, Animation<double>>{};
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated List"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  color: Colors.green,
                  icon: const Icon(
                    Icons.add,
                  ),
                  onPressed: _addItem,
                ),
                IconButton(
                  color: Colors.red,
                  icon: const Icon(Icons.remove),
                  onPressed: _removeItem,
                )
              ],
            ),
          ),
          _itHasNoData(),
          Expanded(
            child: AnimatedList(
              key: listKey,
              initialItemCount: 0,
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index, animation) {
                return buildItem(context, index, animation);
              },
            ),
          ),
        ],
      ),
    );
  }
}
