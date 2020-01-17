import 'package:flutter/material.dart';

class StreamBuilderPage extends StatelessWidget {
  static const String routeName = "/stream-builder";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Demo'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _stream(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error.toString()}");
            }

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.active:
                return _myWidget(snapshot.data);
              case ConnectionState.done:
                return Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text(
                    "Done!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
            }

            return Text("Done!");
          },
          initialData: 0,
        ),
      ),
    );
  }

  Widget _myWidget(int index) {
    switch (index) {
      case 0:
        return Text("Prepare to start!");
      default:
        return Container(
          color: Colors.blue,
          width: index.toDouble(),
          height: index.toDouble(),
          alignment: Alignment.center,
          child: Text(
            index.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
    }
  }

  Stream<int> _stream() {
    Duration interval = Duration(milliseconds: 50);
    Stream<int> stream = Stream<int>.periodic(interval, transform);
    stream = stream.take(100);
    return stream;
  }

  int transform(int value) {
    return value;
  }
}
