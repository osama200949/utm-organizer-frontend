import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/data/clubData.dart';
import 'package:utm_orgnization/models/calendar_model/meeting_info.dart';
import 'package:utm_orgnization/models/club_model/club.dart';
import 'package:utm_orgnization/services/auth_services.dart';
import 'package:utm_orgnization/services/club_data_service.dart';
import 'package:utm_orgnization/services/meetings_service.dart';
import 'package:utm_orgnization/utils/constants.dart';
import 'package:utm_orgnization/utils/routing.dart';
import 'dependencies.dart' as di;
import 'models/provider/meeting_provider.dart';
import 'models/provider/schedule_provider.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './utils/notification_model.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
  SyncfusionLicense.registerLicense(
      'NT8mJyc2IWhia31ifWN9ZmdoYmF8YGJ8ampqanNiYmlmamlmanMDHmg8IDI+MmFjY2pnahM0PjI6P30wPD4=');
  return runApp(App());
  // runApp(App());
}

class App extends StatefulWidget {
  int _currentPageIndex = 0;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final navigatorKey = GlobalKey<NavigatorState>();
  //  final notificationProvider = Provider.of<NotificationProvider>(context);

  Map<String, List<NotificationModel>> notifications = {
    'onMessage' : [],
    'onLaunch' : [],
    'onResume' : [],
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        notifications['onMessage'].add(NotificationModel(title: message['title'], body: message['body']));
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
      },
    );
    widget._firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  void changePage(int index) {
    setState(() {
      widget._currentPageIndex = index;
    });
    if (index == 0) {
      navigatorKey.currentState.pushReplacementNamed(kHomeScreen);
    } else if (index == 1) {
      navigatorKey.currentState.pushReplacementNamed(kCalenderRoute);
    } else if (index == 2) {
      navigatorKey.currentState.pushReplacementNamed(kProfileRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>(
          create: (_) => di.service<AuthServices>().user,
          initialData: null,
        ),
        FutureProvider<List<Club>>(
          create: (context) => di.service<ClubDataService>().getClubs(),
        ),
        ChangeNotifierProxyProvider<List<Club>, ClubData>(
          create: (_) => ClubData(),
          update: (_, clubs, clubData) => clubData..clubs = clubs,
        ),
        ChangeNotifierProxyProvider<User, MeetingProvider>(
          create: (context) => MeetingProvider(),
          update: (context, user, meetingNotifier) =>
              meetingNotifier..user = user,
        ),
        ChangeNotifierProxyProvider<User, ScheduleProvider>(
          create: (context) => ScheduleProvider(),
          update: (context, user, scheduleNotifier) =>
              scheduleNotifier..user = user,
        ),
        ChangeNotifierProvider(
          create: (_) => ClubData(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => ScheduleProvider()..setDataFromDatabase(),
        // ),
      ],
      child: AppView(navigatorKey: navigatorKey, widget: widget),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key key,
    @required this.navigatorKey,
    @required this.widget,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final App widget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: kHomeRoute,
      navigatorKey: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        Router router = Router(
          currentPageIndex: widget._currentPageIndex,
        );
        return router.routing(
          settings,
          context,
        );
      },
    );
  }
}
