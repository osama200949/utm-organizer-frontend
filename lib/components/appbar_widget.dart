import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utm_orgnization/utils/constants.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const TopAppBar({
    this.appBar,
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
        FlatButton(
          onPressed: () async => showDialogue(context),
          child: SvgPicture.asset(
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
