import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utm_orgnization/utils/FeadAnmation.dart';
import 'package:utm_orgnization/utils/constants.dart';

class Activity_widget extends StatelessWidget {
  const Activity_widget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Activites",
              style: kPrimary_heading.copyWith(color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 157,
          child: ListView(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              FadeIn(
                1.8,
                Activity_card(
                  callBack: () {
                    Navigator.pushNamed(context, '/schedule_screen');
                  },
                  iconPath: "calendar",
                  iconTitle: "Class Schdeule",
                ),
              ),
              FadeIn(
                2,
                Activity_card(
                  iconPath: "club",
                  iconTitle: "Clubs",
                ),
              ),
              FadeIn(
                2.2,
                Activity_card(
                  iconPath: "school",
                  iconTitle: "Events",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Activity_card extends StatelessWidget {
  final String iconPath;
  final String iconTitle;
  final callBack;
  Activity_card({this.iconPath, this.iconTitle, this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 15, 10),
        // padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xfff7f7f7),
          boxShadow: kShadow_activityCard,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // crossAxisAlignment: ,
          children: <Widget>[
            SvgPicture.asset(
              'images/icons/$iconPath.svg',
              color: Color(0xff3f3f44),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              iconTitle,
              style: kSecondary_heading_2.copyWith(color: Color(0xff3f3f44)),
            )
          ],
        ),
      ),
    );
  }
}
