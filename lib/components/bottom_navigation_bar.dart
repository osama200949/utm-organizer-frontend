import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/utils/constants.dart';

class BottomNavigation extends StatefulWidget {
  final Function changeIndex;
  final int selectedItemIndex;
  BottomNavigation(this.changeIndex, this.selectedItemIndex);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildNavBarItem('images/navIcons/home.svg', 0),
            buildNavBarItem('images/navIcons/calendar.svg', 1),
            if (widget.selectedItemIndex == 1)
              SizedBox(
                width: 15,
              ),
            buildNavBarItem('images/navIcons/material-favorite.svg', 2),
            buildNavBarItem(
                Provider.of<User>(context)?.photoUrl == null
                    ? "https://gravatar.com/avatar/bf91ea452bc710972b03c716bdf74e15?s=400&d=robohash&r=x"
                    : Provider.of<User>(context)?.photoUrl,
                4),
          ],
        ),
      ),
      shape: CircularNotchedRectangle(),
    );
  }

  buildNavBarItem(String iconPath, int index) {
    return GestureDetector(
      onTap: () => widget.changeIndex(index),
      child: Container(
        width: index == 4 ? 70 : 70,
        child: index != 4
            ? SvgPicture.asset(
                iconPath,
                height: 35,
                color: widget.selectedItemIndex == index
                    ? kRed_primary
                    : Colors.black,
              )
            : CircleAvatar(
                radius: widget.selectedItemIndex == index ? 28 : 28,
                backgroundColor: widget.selectedItemIndex == index
                    ? kRed_primary
                    : Colors.white,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(iconPath),
                ),
              ),
      ),
    );
  }
}
