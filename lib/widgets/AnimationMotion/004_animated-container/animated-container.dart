import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  static const String routeName = "/animated-container";
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  bool isSelected = false;
  String _textAnimCont = "Click Here!";
  Color _colorAnimCont = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Container")),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        "Click Any\nPlace On\nPurple Box\nOn The Right",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    height: 150,
                    color: Colors.deepOrange,
                    padding: EdgeInsets.all(10),
                  ),
                  Expanded(
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _textAnimCont = "Yeah! It works.\n" +
                                "But only once.\n" +
                                "You can't go back.";
                            _colorAnimCont = Colors.blue[700];
                          });
                        },
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            _textAnimCont,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          color: _colorAnimCont,
                          curve: Curves.easeInOutSine,
                          height: 40,
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                      color: Colors.blueGrey,
                      padding: EdgeInsets.all(20),
                      height: 150,
                    ),
                    flex: 2,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: 400,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Center(
                        child: SafeArea(
                          minimum: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "The blue box on the right is the real Widget \"Animated Container\".",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Divider(
                                color: Colors.white30,
                                thickness: 1,
                                height: 30,
                              ),
                              Text(
                                "When you click on the box, it will change based on the setState function.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Divider(
                                color: Colors.white30,
                                thickness: 1,
                                height: 30,
                              ),
                              Text(
                                "It cannot be a StatelessWidget because you need to change the Container's properties when you Tap the box.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 400,
                      color: Colors.lightGreenAccent,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Center(
                          child: AnimatedContainer(
                              child: Center(
                                child: Text(
                                  "CLICK HERE!\n\n" +
                                      "Wait for the magic.\n\n"
                                          "Then, click again.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              width: isSelected ? 160.0 : 200.0,
                              height: isSelected ? 160.0 : 200.0,
                              padding: EdgeInsets.all(10),
                              color: isSelected
                                  ? Colors.lightBlue[600]
                                  : Colors.blue[400],
                              alignment: isSelected
                                  ? Alignment.center
                                  : AlignmentDirectional.topCenter,
                              duration: Duration(seconds: 2),
                              curve: Curves.fastOutSlowIn),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
