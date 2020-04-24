import 'package:flutter/material.dart';

class ShaderMaskPage extends StatelessWidget {
  static const String routeName = "/shader-mask";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shader Mask"),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return (index < 9)
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: listShaderItem(
                    index,
                    Text(
                      'Item ${index + 1}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : listShaderItem(
                  index,
                  Container(
                    alignment: Alignment.center,
                    color: Colors.amber,
                    height: 30,
                    width: 200,
                    margin: EdgeInsets.all(10),
                  ),
                );
        },
      ),
    );
  }

  Widget listShaderItem(int index, Widget widgetChild) => ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect bounds) {
          return RadialGradient(
            center: Alignment.topLeft,
            radius: 2.0,
            colors: <Color>[
              Colors.yellow,
              Colors.deepOrange.shade100,
              Colors.deepOrange.shade300,
              Colors.deepOrange.shade500,
              Colors.deepOrange.shade700,
              Colors.deepOrange.shade900,
            ],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: Center(
          child: widgetChild,
        ),
      );
}
