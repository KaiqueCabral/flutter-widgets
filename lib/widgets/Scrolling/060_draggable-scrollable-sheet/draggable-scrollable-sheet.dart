import 'package:flutter/material.dart';

class DraggableScrollableSheetPage extends StatelessWidget {
  static const String routeName = "/draggable-scrollable-sheet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draggable Scrollable Sheet"),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          minChildSize: 0.25,
          maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
