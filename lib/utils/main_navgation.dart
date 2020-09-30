import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/components/bottom_navigation_bar.dart';
import 'package:utm_orgnization/models/provider/meeting_data.dart';
import 'package:utm_orgnization/screens/activities_screens/club_event_info.dart';
import 'package:utm_orgnization/screens/calendar_screen/add_task.dart';
import 'package:utm_orgnization/screens/calendar_screen/calendar.dart';
import 'package:utm_orgnization/screens/home_screen/home_screen.dart';
import 'package:utm_orgnization/screens/profile_screens/profile_screen.dart';
import 'package:animations/animations.dart';
import 'package:utm_orgnization/screens/saved_screen/saved_screen.dart';
import 'package:utm_orgnization/utils/constants.dart';

class MainNavigation extends StatefulWidget {
  int currentIndex;
  MainNavigation({this.currentIndex = 0});
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // int index = 0;
  void changeIndex(int val) {
    setState(
      () {
        widget.currentIndex = val;
      },
    );
  }

  List<Widget> page = [];

  @override
  void initState() {
    page.add(HomeScreen());
    page.add(CalendarScreen());

    /// add hte club and events
    page.add(Clubs());
    // page.add(SavedScreen());
    page.add(ProfileScreen());
    page.add(ProfileScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: page[widget.currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget.currentIndex == 1
          ?
          // FloatingActionButton(
          //     child: Icon(Icons.add),
          //     backgroundColor: Colors.red,
          //     onPressed: () => Navigator.pushNamed(
          //       context,
          //       kAddTask,
          //       arguments: Provider.of<MeetingData>(context, listen: false),
          //     ),
          //   )
          OpenContainer(
            useRootNavigator: true,
            closedElevation: 0.0,
            openElevation: 0.0,
            openColor: Colors.transparent,
            closedColor: Colors.transparent,
              closedBuilder: (context, action) {
                return FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Colors.red,
                  // elevation: 0.0,
                  onPressed: action,
                );
              },
              openBuilder: (context, action) {

                return AddTask();
              },
            )
          : null,
      bottomNavigationBar: BottomNavigation(changeIndex, widget.currentIndex),
    );
  }
}
