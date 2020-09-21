import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/schedule_data.dart';
import 'package:utm_orgnization/utils/constants.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final isCalendar;

  const TopAppBar({
    this.appBar,
    this.isCalendar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: null,
      title: Row(
        children: <Widget>[
          SvgPicture.asset('images/logos/logo-mini.svg'),
        ],
      ),
      actions: <Widget>[
        SvgPicture.asset('images/icons/icon-bell.svg'),
        isCalendar
            ? FlatButton(
                onPressed: () =>
                    Navigator.pushNamed(context, kTimetablePreview),
                child:
                    Provider.of<ScheduleData>(context).selectedCourses.length >
                            0
                        ? Image.asset(
                            // When there is selected courses > 0
                            'images/icons/timetable_is_updated.png',
                            fit: BoxFit.contain,
                            width: 32,
                            height: 32,
                          )
                        : SvgPicture.asset(
                            // When there is no courses == 0
                            'images/icons/timetable_is_updated.svg',
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ))
            : FlatButton(
                onPressed: () async => showDialogue(context),
                child: SvgPicture.asset(
                  // 'images/icons/timetable_is_updated.svg',
                  'images/icons/dashborad.svg',
                ),
              ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

Future<void> showDialogue(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        // contentPadding: EdgeInsets.all(0.0),
        // backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ItemDashborad(
                iconPath: 'images/icons/qrcode.svg',
                title: 'QR code',
                onTap: () {},
              ),
              ItemDashborad(
                iconPath: 'images/icons/local-activity.svg',
                title: 'Saved Activities',
                onTap: () {},
              ),
              ItemDashborad(
                iconPath: 'images/icons/logout.svg',
                title: 'Logout',
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ItemDashborad(
                iconPath: 'images/icons/club.svg',
                title: 'Create club',
                onTap: () {
                  Navigator.pushNamed(context, kClubScreenWalkthrow);
                },
              ),
              ItemDashborad(
                iconPath: 'images/icons/event.svg',
                title: 'Create Event',
                onTap: () {
                  Navigator.pushNamed(context, kAddEventRoute);
                },
              ),
            ],
          )
        ],
      );
    },
  );
}

class ItemDashborad extends StatelessWidget {
  final String iconPath;
  final String title;
  final Function onTap;

  ItemDashborad({this.iconPath, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            iconPath,
            height: MediaQuery.of(context).size.width * 0.08,
          ),
          SizedBox(
            height: 10,
          ),
          Text(title),
        ],
      ),
    );
  }
}
