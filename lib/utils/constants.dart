import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

//! Routing -

const kRootRoute = '/kMainNv';
const kHomeRoute = '/SpalshScreen';
const kWlcomeViewRoute = '/WelcomingView';
const kWlcomeScreenRoute = '/WelcomingView';
const kScheduleRoute = '/schedule_screen';
const kScheduleDetailsRoute = '/schedule_detail';
const kClubRoute = '/club_info';
const kEventRoute = '/event_info';
const kChoseScreenRoute = '/ChoseScreen';
const kProfileRoute = '/profile';
const kSignInRoute = '/signIn';
const kSigUpRoute = '/signUp';
const kLogoutRoute = '/Logout';
const kEventInfoRoute = '/event_info';

const kCalenderRoute = '/calender';
const kCalenderDetailsRoute = '/calender_detail';
const kClubInfoRoute = '/club_info';
const kCreateClubRoute = '/create_club';
const kClubScreen2 = '/club_screen';
const kClubEdit = '/club_Edit';
const kClubScreenWalkthrow = '/create_club_Walkthrow';
const kQrCode = '/QrCode';
const kTimetable = '/timetable';
const kTimetablePreview = '/timetable_preview';
const kAddEventRoute = '/add_event';
const kAddTask = '/add_task';
const kUpdateTask = '/update_task';
const kInboxScreen = '/inbox_screen';
const kEventInfo = '/events_info';
const kSchduleScreen = '/schedule_screen';
const kWelcoming = '/welcoming';

const kMainNv = '/';
const kWrapper = 'wrapper';
//! Style - Font
const kOrange_primary = Color(0xffF57B51);
const kYellow_primary = Color(0xffFECA3C);
const kRead_primary = Color(0xffD63447);
const kgrey_primary = Color(0xff535252);
const kpiegp_primary = Color(0xffD63447);
const kgreyT_primary = Color(0xff7d7d7d);
const kWhiteGreyT_primary = Color(0xffCDCBC9);

const List<Color> kOrange_gradient = [
  Color(0xffC75D38),
  Color(0xff7B3E29),
];
const List<Color> kBtn_gradient = [
  Color(0xffD63447),
  Color(0xffF57B51),
];
const List<Color> kGender_Active = [
  Color(0xffFF971D),
  Color(0xffF57B51),
];
const List<Color> kGender_disable = [
  Color(0xffEAEAEA),
  Color(0xff757575),
];
const List<Color> kBlack_gradient = [
  Color(0xff535252),
  Color(0xff111010),
];
const List<Color> kRed_gradient = [Color(0xffD63447), Color(0xff6B1A24)];

// osama constants
const Color whiteBrown = Color(0xffF57B51);
const Color darkBrown = Color(0xffD6762B);
const Color yellow = Color(0xffFF971D);
const Color offBrown = Color(0xffFFD6A6);
const Color darkRed = Color(0xffD63447);
const Color whiteRed = Color(0xffFF4949);
const Color offWhite = Color(0xffEAEAEA);
const Color grey = Color(0xffCDCBC9);
const Color darkGrey = Color(0xffA0A0A0);

//Box-shdows

const List<BoxShadow> kShadow_activityCard = [
  BoxShadow(
    color: Color(0x26000000),
    blurRadius: 3, // has the effect of softening the shadow
    spreadRadius: 1, // has the effect of extending the shadow
    offset: Offset(
      0.0, // horizontal, move right 10
      1.0, // vertical, move down 10
    ),
  )
];

const List<BoxShadow> kShadow_eventImage = [
  BoxShadow(
    color: Color(0x33000000),
    blurRadius: 100, // has the effect of softening the shadow
    spreadRadius: 1, // has the effect of extending the shadow
    offset: Offset(
      0.0, // horizontal, move right 10
      3.0, // vertical, move down 10
    ),
  )
];

// Typographys
const kPrimary_heading = TextStyle(
    fontSize: 24,
    fontFamily: "Muli",
    fontWeight: FontWeight.w500,
    color: Colors.white);

const kSecondary_heading = TextStyle(
    fontSize: 16,
    fontFamily: "Muli",
    fontWeight: FontWeight.w500,
    color: Colors.white);

const kPrimary_heading_2 = TextStyle(
    fontSize: 24,
    fontFamily: "Raleway",
    fontWeight: FontWeight.w500,
    color: Colors.white);

const kSecondary_heading_2 = TextStyle(
    fontSize: 16,
    fontFamily: "Raleway",
    fontWeight: FontWeight.w500,
    color: Colors.white);

const kPrimary_heading_3 = TextStyle(
    fontSize: 23,
    fontFamily: "Gotham",
    fontWeight: FontWeight.w700,
    color: Colors.white);

final kSignInTextField = InputDecoration(
  labelText: "TextField Lable",
  labelStyle: TextStyle(color: kOrange_primary),
  prefixIcon: Icon(LineAwesomeIcons.envelope, color: kOrange_primary),
  fillColor: kOrange_primary,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kOrange_primary, width: 2.0),
    borderRadius: BorderRadius.circular(25.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kOrange_primary, width: 2.0),
    borderRadius: BorderRadius.circular(25.0),
  ),
);

final kSignUpTextField = InputDecoration(
  labelText: "TextField Lable",
  labelStyle: TextStyle(color: Colors.white),
  prefixIcon: Icon(LineAwesomeIcons.envelope, color: Colors.white),
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.circular(25.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.circular(25.0),
  ),
);

//! meeting data const
const int dCategoryIndex = 0;

final kClubNameTextField = InputDecoration(
  labelText: "TextField Lable",
  labelStyle: TextStyle(
    color: Colors.black,
  ),
  fillColor: Colors.black,
);

const List<Color> eventch1 = [
  Color(0xff464154),
  Color(0xffE6C026),
];
const List<Color> eventch2 = [
  Color(0xffDA5167),
  Color(0xff0288D1),
];
const List<Color> eventch3 = [
  Color(0xff45606F),
  Color(0xff704B4B),
];
const List<Color> eventch4 = [
  Color(0xffE04712),
  Color(0xff12BCE0),
];
const List<Color> eventColors = [
  // Color(0xffE04712),
  // Color(0xff12BCE0),
  // Color(0xffE6C026),
  // Color(0xff45606F),
  // Color(0xffDA5167),

  Color(0xff464154),
  Color(0xffDA5167),
  Color(0xff45606F),
  Color(0xffE04712),
  Color(0xff88d8b0),
  Color(0xffD8889B),
];
const List<Color> eventSecondaryColors = [
  // Color(0xffDA5167),
  // Color(0xff88d8b0),
  // Color(0xff12BCE0),
  // Color(0xffE6C026),
  // Color(0xffE04712),
  // Color(0xff45606F),

  Color(0xffE6C026),
  Color(0xff0288D1),
  Color(0xff704B4B),
  Color(0xff12BCE0),
  Color(0xffD888B0),
  Color(0xff88D8C5),
];
