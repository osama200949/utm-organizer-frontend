import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class BottomNavigation extends StatelessWidget {
  final Function changePage;
  final int index;
  BottomNavigation({this.index, this.changePage});
  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: index,
      onTap: changePage,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      elevation: 8,
      items: <BubbleBottomBarItem>[
        BubbleBottomBarItem(
          backgroundColor: Colors.white,
          icon: Icon(
            LineAwesomeIcons.home,
            color: Colors.black,
          ),
          activeIcon: Icon(
            LineAwesomeIcons.home,
            color: Colors.red,
          ),
          title: Text(""),
        ),
        BubbleBottomBarItem(
          backgroundColor: Colors.white,
          icon: Icon(
            LineAwesomeIcons.calendar,
            color: Colors.black,
          ),
          activeIcon: Icon(
            LineAwesomeIcons.calendar,
            color: Colors.red,
          ),
          title: Text(""),
        ),
        BubbleBottomBarItem(
          backgroundColor: Colors.white,
          icon: Icon(
            LineAwesomeIcons.user,
            color: Colors.black,
          ),
          activeIcon: Icon(
            LineAwesomeIcons.user,
            color: Colors.red,
          ),
          title: Text(""),
        ),
      ],
    );
  }
}
