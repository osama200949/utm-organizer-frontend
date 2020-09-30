import 'package:flutter/material.dart';
import 'package:utm_orgnization/screens/activities_screens/club_event_info.dart';
import 'package:utm_orgnization/screens/activities_screens/club_screen/club_info.dart';
import 'package:utm_orgnization/screens/activities_screens/club_screen/create_clubScreen.dart';
import 'package:utm_orgnization/screens/activities_screens/club_screen/edit_clubScreen.dart';
import 'package:utm_orgnization/screens/activities_screens/event_screen/add_event.dart';
import 'package:utm_orgnization/screens/activities_screens/event_screen/event_info.dart';
import 'package:utm_orgnization/screens/auth/Logout.dart';
import 'package:utm_orgnization/screens/auth/sign_in_screen.dart';
import 'package:utm_orgnization/screens/auth/sign_up_screen.dart';
import 'package:utm_orgnization/screens/auth/welcome_screen.dart';
import 'package:utm_orgnization/screens/auth/wrapper.dart';
import 'package:utm_orgnization/screens/calendar_screen/add_task.dart';
import 'package:utm_orgnization/screens/calendar_screen/calendar.dart';
import 'package:utm_orgnization/screens/calendar_screen/calendar_details_screen.dart';
import 'package:utm_orgnization/screens/calendar_screen/update_task.dart';
import 'package:utm_orgnization/screens/home_screen/home_screen.dart';
import 'package:utm_orgnization/screens/profile_screens/profile_screen.dart';
import 'package:utm_orgnization/screens/schedule_screen/schedule_screen.dart';
import 'package:utm_orgnization/screens/schedule_screen/schedule_detail_screen.dart';
import 'package:utm_orgnization/screens/schedule_screen/selected_courses_screen.dart';
import 'package:utm_orgnization/screens/schedule_screen/timetable.dart';
import 'package:utm_orgnization/screens/schedule_screen/timetable_preview.dart';
import 'package:utm_orgnization/screens/splash_screens/choose_page.dart';
import 'package:utm_orgnization/screens/splash_screens/onborading_screens/welcoming_view.dart';
import 'package:utm_orgnization/screens/splash_screens/splash_screen.dart';

import 'package:utm_orgnization/utils/constants.dart';
import 'package:utm_orgnization/utils/main_navgation.dart';

class Router {
  Function changePage;
  int currentPageIndex;

  Router({this.changePage, this.currentPageIndex});

  MaterialPageRoute<dynamic> routing(
      RouteSettings settings, BuildContext context) {
    final data = settings.arguments;
    WidgetBuilder builder;
    switch (settings.name) {
      case kRootRoute:
        builder = (BuildContext context) => HomeScreen();
        break;
      case kSignInRoute:
        builder = (BuildContext context) => SignInScreen();
        break;
      case kSigUpRoute:
        builder = (BuildContext context) => SignUpScreen();
        break;
      case kLogoutRoute:
        builder = (BuildContext context) => LogoutScreen();
        break;
      case kChoseScreenRoute:
        builder = (BuildContext context) => ChoseScreen();
        break;
      case kWrapper:
        builder = (_) => Wrapper();
        break;
      case kCalenderRoute:
        // builder = (BuildContext context) => CalendarScreen();
        builder = (BuildContext context) => MainNavigation(
              currentIndex: 1,
            );
        break;
      case kWlcomeViewRoute:
        builder = (BuildContext context) => WelcomingView();
        break;
      case kWlcomeScreenRoute:
        builder = (BuildContext context) => WelcomeScreen();
        break;
      case kHomeRoute:
        builder = (BuildContext context) => SplashScreen();
        break;
      // case kAddEventRoute:
      //   builder = (BuildContext context) => Events();
      //   break;
      case kMainNv:
        builder = (BuildContext context) => MainNavigation(
          currentIndex: 0,
        );
        break;

      // case kQrCode:
      //   builder = (BuildContext context) => QrCode();
      //   break;
      case kAddTask:
        builder = (BuildContext context) => AddTask();
        break;

      case kUpdateTask:
        builder = (BuildContext context) => UpdateTask();
        break;

      case kInboxScreen:
        builder = (BuildContext context) => Clubs(
              index: currentPageIndex,
              changePage: changePage,
            );
        break;

      case kCalenderDetailsRoute:
        builder = (BuildContext context) => CalenderDetail();
        break;
      case kProfileRoute:
        // builder = (BuildContext context) => ProfileScreen();
        builder = (BuildContext context) => MainNavigation(
              currentIndex: 3,
            );
        break;

      case kEventInfoRoute:
        builder = (BuildContext context) => EventinfoScreen(
              event: data,
            );
        break;
      case kClubInfoRoute:
        builder = (BuildContext context) => ClubinfoScreen();
        break;

      case kScheduleDetailsRoute:
        builder = (BuildContext context) => ScheduleDetail();
        break;

      case kSchduleScreen:
        builder = (BuildContext context) => ScheduleScreen();
        break;

      case kClubScreenWalkthrow:
        builder = (BuildContext context) => ClubScreenWalkthrow();
        break;

      case kClubEdit:
        builder = (BuildContext context) => EditScreenWalkthrow(
              club: data,
            );
        break;
      case kTimetable:
        builder = (BuildContext context) => Timetable(
            // data,
            );
        break;
      case kTimetablePreview:
        builder = (BuildContext context) => TimetablePreview();
        break;
      case kSelectedCourses:
        builder = (BuildContext context) => SelectedCoursesScreen();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }
    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
