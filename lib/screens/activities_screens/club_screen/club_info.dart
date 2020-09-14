import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/club_model/club.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/utils/constants.dart';

class ClubinfoScreen extends StatefulWidget {
  final Club club;
  ClubinfoScreen({
    this.club,
  });

  @override
  _ClubinfoScreenState createState() => _ClubinfoScreenState();
}

class _ClubinfoScreenState extends State<ClubinfoScreen> {
  List<Widget> interester = [];
  // _circleAvter() {
  //   widget.club.clubInterster.forEach(
  //     (User user) {
  //       interester.add(
  //         Container(
  //           padding: EdgeInsets.only(right: 2),
  //           child: CircleAvatar(
  //             backgroundColor: Colors.transparent,
  //             backgroundImage: NetworkImage(user.imageUrl),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //   return Row(
  //     children: interester,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.60,
                child: widget.club.imagesPath != null
                    ? Image(
                        image: NetworkImage(
                          widget.club.imagesPath,
                        ),
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset(
                        'images/logos/logo-soical.svg',
                        fit: BoxFit.cover,
                      ),
              ),
            ],
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                      child: Text(
                        "Club",
                        style: kSecondary_heading,
                      ),
                      decoration: BoxDecoration(
                        color: widget.club.colorHexa != null
                            ? Color(widget.club.colorHexa)
                            : kOrange_primary,
                        borderRadius: BorderRadius.circular(250),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(
                        FontAwesomeIcons.solidCircle,
                        size: 7,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.club.categoryClub != null
                          ? widget.club.categoryClub
                          : 'Others',
                      style: kPrimary_heading.copyWith(
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      boxShadow: kShadow_activityCard,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    widget.club.clubName,
                                    style: kPrimary_heading_3.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  widget.club.uid ==
                                          Provider.of<User>(context).uid
                                      ? IconButton(
                                          icon: Icon(FontAwesomeIcons.edit),
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                              context,
                                              kClubEdit,
                                              arguments: widget.club,
                                              result: null,
                                            );
                                          },
                                        )
                                      : Text(''),
                                ],
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                widget.club.clubDescription == null
                                    ? Text("clubDescriptin")
                                    : widget.club.clubDescription,
                                style: kSecondary_heading_2.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        'images/icons/facebook.svg',
                                        height: 30,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        widget.club.facebookPath == null
                                            ? 'NULL'
                                            : widget.club.facebookPath,
                                        style: kSecondary_heading_2.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.phone,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        widget.club.clubPhone == null
                                            ? Text('Null')
                                            : widget.club.clubPhone,
                                        style: kSecondary_heading_2.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            // _circleAvter(),
                            Spacer(
                              flex: 1,
                            ),
                            Row(
                              children: <Widget>[
                                Spacer(
                                  flex: 2,
                                ),
                                Expanded(
                                  flex: 100,
                                  child: GestureDetector(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Spacer(
                                            flex: 5,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.star_border,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 2,
                                          ),
                                          Expanded(
                                            flex: 19,
                                            child: Text(
                                              "INTERESTED",
                                              style: kPrimary_heading_3,
                                            ),
                                          ),
                                        ],
                                      ),
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: widget.club.colorHexa != null
                                            ? Color(widget.club.colorHexa)
                                            : kOrange_primary,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
