import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/data/clubData.dart';
import 'package:utm_orgnization/models/club_model/club.dart';
import 'package:utm_orgnization/screens/activities_screens/club_screen/club_info.dart';
import 'package:utm_orgnization/utils/FeadAnmation.dart';
import 'package:utm_orgnization/utils/constants.dart';

class Club_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clubData = Provider.of<ClubData>(context);
    return FutureBuilder(
      future: clubData.getList(),
      builder: (context, snapshot) =>
          clubData.clubs == null ? _progressIndicator() : _buildScreen(context),
    );
  }

  Text _progressIndicator() {
    return Text('Getting clubs..',
        style: kSecondary_heading.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 20,
        ));
  }

  Column _buildScreen(BuildContext context) {
    final clubData = Provider.of<ClubData>(context);
    final clubs = clubData.clubs;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Populer Clubs",
              style: kPrimary_heading.copyWith(color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Wrap(
            spacing: 0,
            children: List.generate(
              clubs.length,
              (index) => FadeIn(
                2 + (index * 0.5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClubinfoScreen(
                          club: clubs[index],
                        ),
                      ),
                    );
                  },
                  child: Club_card(
                    club: clubs[index],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class Club_card extends StatelessWidget {
  final Club club;
  Club_card({this.club});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 10),
      child: Stack(
        children: <Widget>[
          Container(
            width: 190,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(club.imagesPath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 6,
                  spreadRadius: 1,
                  offset: Offset(
                    0.0,
                    3.0,
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                width: 190,
                height: 180,
                decoration: BoxDecoration(
                  color: Color(0x99000000),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(
                        flex: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          club.clubName,
                          style: kPrimary_heading_2.copyWith(
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xffD63447),
                  radius: 20,
                  child: SvgPicture.asset(
                    'images/icons/club.svg',
                    color: Colors.white,
                    height: 25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// if (clubData.clubs == null) return CircularProgressIndicator();
