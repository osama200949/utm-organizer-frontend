import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: RaisedButton(
              color: Colors.white,
              splashColor: Colors.white,
              elevation: 0.0,
              child: Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 50,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              "Profile Information",
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
                margin: EdgeInsets.only(top: 25, left: 28, right: 28),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Image.asset(
                          "images/profile_pic.png",
                          width: 105.5,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: 42,
                          width: 42,
                          margin: EdgeInsets.only(left: 65, top: 65),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(42),
                            color: Color(0xFFF57B51),

                          ),
                           child: Icon(
                             FontAwesomeIcons.camera,
                             color: Colors.white,
                             size: 25,
                           ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 39,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hasFloatingPlaceholder: true,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hasFloatingPlaceholder: true,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hasFloatingPlaceholder: true,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hasFloatingPlaceholder: true,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
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
                "SAVE",
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
      ),
    );
  }
}
