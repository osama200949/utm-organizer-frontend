import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Help",
            style: TextStyle(
              fontFamily: 'Muli',
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("images/help.png"),
                  Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA0A0A0),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: constraints.maxWidth,
          height: 62,
          margin: EdgeInsets.all(35),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0XFFFF971D),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            color: Color(0xFFF57B51),
            child: Text(
              "Contact Us",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
