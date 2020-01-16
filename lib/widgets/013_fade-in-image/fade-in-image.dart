import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeInImagePage extends StatefulWidget {
  static const String routeName = "/fade-in-image";

  _FadeInImagePage createState() => _FadeInImagePage();
}

class _FadeInImagePage extends State<FadeInImagePage> {
  String _imageURL =
      'https://img.ibxk.com.br/2019/10/29/flutter-29101357380259.jpg?w=200';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fade In Image"),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: Duration(
                    seconds: 2,
                  ),
                  fadeInCurve: Curves.easeInToLinear,
                  placeholder: kTransparentImage,
                  image: _imageURL,
                  height: 300,
                ),
              ),
              Container(
                child: Text("Flutter - Fade In Image"),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: FadeInImage.assetNetwork(
                  fadeInDuration: Duration(
                    seconds: 1,
                  ),
                  fadeInCurve: Curves.easeInToLinear,
                  placeholder: 'assets/images/loading.gif',
                  image: 'assets/images/flutter-fade-in-image.jpg',
                  height: 300,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.zoom_in,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            _imageURL =
                "https://img.ibxk.com.br/2019/10/29/flutter-29101357380259.jpg?w=400";
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
