import 'package:flutter/material.dart';
import 'package:utm_orgnization/models/calendar_model/meeting_info.dart';
import 'package:utm_orgnization/services/meetings_service.dart';
import '../../dependencies.dart';
import '../user.dart';

class MeetingData extends ChangeNotifier {
  MeetingData() {
    setCurrentDay(DateTime.now());
    currentEventNumber = 0;
  }

  User _user;
  get user => _user;
  set user(User newUser) {
    _user = newUser;
    setUserMeetings();
    notifyListeners();
  }

  Future<void> setUserMeetings() async {
    if (_user == null) return;
    meetingService.userID = _user.uid;
    final meetings = await meetingService.getUserMeetings();
    setMeetingsFromServer(meetings);
    notifyListeners();
  }

  List serverMeetings = [];

  Future<List<MeetingInfo>> getMeetingsFromServer() async {
    final result = await meetingService.getAllMeetings();
    return result;
  }

  void setMeetingsFromServer(List<MeetingInfo> data) {
    serverMeetings = data;
    if (dateInfo.isNotEmpty)
      dateInfo.forEach((key, value) => value.removeRange(0, value.length));

    if (serverMeetings != null)
      serverMeetings.forEach((element) => addDateInfoTask(element));

    print('serverMeetings');
    print(serverMeetings);
    notifyListeners();
  }

//! Top calendar

  void setCurrentDay(DateTime newDate) {
    currentDay = DateTime(newDate.year, newDate.month, newDate.day);
    if (dateInfo[currentDay] == null) dateInfo[currentDay] = [];
    notifyListeners();
  }

  DateTime get getCurrentDay => currentDay;

  set setCurrentEvent(int newEvent) {
    currentEventNumber = newEvent;
    notifyListeners();
  }

  int getCurrentEventIndex() => currentEventNumber;

  MeetingInfo getEventToBeShown() => dateInfo[currentDay][currentEventNumber];

  List<MeetingInfo> currentDayInfo() => dateInfo[currentDay];

  MeetingInfo infoAtIndex(int index) => dateInfo[currentDay][index];

  int currendDayInfoLength() => dateInfo[currentDay].length;

  int getLength(DateTime newDate) {
    var tempDate = DateTime(newDate.year, newDate.month, newDate.day);
    if (dateInfo[tempDate] == null)
      return 0;
    else
      return dateInfo[tempDate].length;
  }

  //! Mock Data new Info with date
  Map<DateTime, List<MeetingInfo>> dateInfo = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [],
  };

  // ! Add Task
  static List<Color> bgColors = [
    Color(0xffFFD6A6),
    Color(0xffB09797),
    Color(0xffF2DA77),
    Color(0xffF28863),
    Color(0xff58A2CB),
    Color(0xffF38496),
    Color(0xffBCA9F0),
    Color(0xffFFDBDB),
  ];
  Color getBgColors(int index) => bgColors[index];
  get bgColorsLength => bgColors.length;

  void setCurrentColor(int index) {
    currentColor = index;
    notifyListeners();
  }

  Color getCurrentColor(int index) {
    return getBgColors(currentColor);
  }

  bool getHighlightedColor(int index) {
    if (index != currentColor)
      return false;
    else
      return true;
    notifyListeners();
  }

//! Category
  Color getBoxColor(int index) {
    return index == currentCategory ? Color(0xffD63447) : Color(0xffF5F5F5);
    // return index == getCategoryIndex(tempTask.labelCategory) ? Color(0xffD63447) : Color(0xffF5F5F5);
  }

  Color getTextColor(int index) {
    return index == currentCategory ? Colors.white : Colors.black;
    // return index == getCategoryIndex(tempTask.labelCategory) ? Colors.white : Colors.black;
  }

  static List<String> categories = [
    'Task',
    'Activity',
    'Class',
    'Event',
    'Club',
  ];

  int getCategoryIndex(String category) {
    for (int i = 0; i < categories.length; i++) {
      if (categories[i] == category) return i;
    }
    return 0;
  }

  String getCategory(int index) => categories[index];
  get categoriesLength => categories.length;

  void setCurrentCategory(int index) {
    currentCategory = index;
    notifyListeners();
  }

  //!reseting the add task data for cancel
  void resetTask() {
    tempTask = MeetingInfo(
      startTime: dDate,
      endTime: dDate,
      meetingTitle: dTaskTitle,
      description: dTaskDescription,
      location: dLocation,
      backgroundColor: bgColors[dCurrentColor],
      labelCategory: categories[dCategoryIndex],
      lableColor: Colors.black,
    );
    currentCategory = null;
    notifyListeners();
  }

  //! Add Coming From Server Task
  void addDateInfoTask(MeetingInfo newTask) {
    DateTime newDay = DateTime(
        newTask.startTime.year, newTask.startTime.month, newTask.startTime.day);

    dateInfo.update(newDay, (value) {
      value.add(newTask);
      return value;
    }, ifAbsent: () => [newTask]);

    resetTask();
    notifyListeners();
  }

  final meetingService = service<MeetingService>();

  //! Add Task
  void addTask({MeetingInfo newTask}) async {
    MeetingInfo temp = newTask;
    if (temp == null) {
      temp = tempTask;
    }
    final result = await meetingService.createMeeting(temp);
    addDateInfoTask(result);
    resetTask();
    notifyListeners();
  }

  void setTaskToBeUpdated() {
    tempTask = getEventToBeShown();
    currentCategory = getCategoryIndex(tempTask.labelCategory);
  }

  //! Update Task
  void updateTask() async {
    // final temp = dateInfo[currentDay][currentEventNumber];
    final result = await meetingService.updateMeeting(
        'meetings/${dateInfo[currentDay][currentEventNumber].id}',
        data: tempTask);
    dateInfo[currentDay].removeAt(currentEventNumber);
    addDateInfoTask(result);
    resetTask();
    notifyListeners();
  }

  //! Delete Task //? Done
  void deleteCurrentEventToBeShown() async {
    await meetingService.deleteMeeting(
        'meetings/${dateInfo[currentDay][currentEventNumber].id}');
    dateInfo[currentDay].removeAt(currentEventNumber);
    resetTask();
    notifyListeners();
  }

  //! All Current Values + variables
  MeetingInfo tempTask = MeetingInfo(
    startTime: dDate,
    endTime: dDate,
    meetingTitle: dTaskTitle,
    description: dTaskDescription,
    location: dLocation,
    backgroundColor: bgColors[dCurrentColor],
    labelCategory: categories[dCategoryIndex],
    lableColor: Colors.black,
  );

  DateTime currentDay = DateTime.now();
  int currentEventNumber = 0;
  int currentColor = 0;
  int currentCategory = null;
  List<MeetingInfo> currentTimetable;

//! Defulat const values
  static final int dCategoryIndex = 0;
  static final DateTime dDate = DateTime.now();
  static final int dCurrentColor = 0;
  static final String dTaskTitle = 'No title';
  static final String dTaskDescription = 'No description';
  static final String dLocation = 'Unknown';
} // MeetingData{}

//? Archieve
// void deleteTask({String id, MeetingInfo meeting}) {
//   if (id != null) {
//     meetingService.deleteMeeting('meetings/$id');
//     resetTask();
//     notifyListeners();
//     return;
//   }
//   if (meeting != null) {
//     meetingService.deleteMeeting('meetings/${meeting.id}');
//     resetTask();
//     notifyListeners();
//     return;
//   }
//   return;
// }

// static List<Category> categories = [
//   Category('Task'),
//   Category('Activity'),
//   Category('Class'),
//   Category('Event'),
//   Category('Club'),
// ];

// MeetingInfo(
//   meetingTitle: 'Toastmaster',
//   labelCategory: 'Club',
//   location: 'N28,CGMTL',
//   backgroundColor: Color(0xffFFDBDB),
//   lableColor: Color(0xffD63447),
//   description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,',
//   startTime: DateTime.now(),
//   endTime: DateTime.now().add(Duration(hours: 2)),
// ),
// MeetingInfo(
//   meetingTitle: 'Mobile Application Development ',
//   labelCategory: 'Class',
//   location: 'N28,CGMTL',
//   backgroundColor: Color(0xffFFD6A6),
//   lableColor: Color(0xffF57B51),
//   description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,',
//   startTime: DateTime.now(),
//   endTime: DateTime.now().add(Duration(hours: 2)),
// ),

//addDateInfoTask(){}
// if (dateInfo[newDay] == null)
//   dateInfo[newDay] = [newTask];
// else {
//   bool isExist = false;
//   dateInfo[newDay].forEach((e) {
//     if (e == newTask) isExist = true;
//   });
//   if (!isExist) {
//     dateInfo[newDay].add(newTask);
//   }
// }

//! Set timetable on calendar feature
// bool isThereTimetable = false;
// static final today = DateTime.now();
// void setTimeTable(List<ClassInfo> classes) {
//   List<MeetingInfo> meetings = [];
//   //? Sem starat date TODO: change later with the exact sem start date
//   DateTime semStart =
//       DateTime(today.year, DateTime.september, 29, today.hour);
//   // CREATE
//   if (!isThereTimetable) {
//     for (int i = 0; i < classes.length; i++) {
//       DateTime tempStart = classes[i]
//           .startTime
//           .add(Duration(days: semStart.difference(today).inDays));
//       DateTime tempEnd = classes[i]
//           .endTime
//           .add(Duration(days: semStart.difference(today).inDays));
//       //? REPEAT FOR 4 MONTHS FROM THE CHOOSEN DAY
//       int numberOfMonths = 4;
//       var course;
//       for (int j = 0; j < (numberOfMonths * 4); j++) {
//         course = MeetingInfo(
//           isCourse: true, // Main difference to know it is a course
//           meetingTitle: classes[i].name,
//           labelCategory: 'Class',
//           startTime: tempStart,
//           endTime: tempEnd,
//           location: classes[i].code,
//           backgroundColor: Color(0xffFFD6A6),
//           lableColor: Color(0xffF57B51),
//           description: 'You have class with Dr.${classes[i].doctorName}',
//         );

//         addTask(newTask: course);

//         tempStart = tempStart.add(Duration(days: 7));
//         tempEnd = tempEnd.add(Duration(days: 7));
//       }
//     }

//     currentTimetable = meetings;

//     //? There Is A Timetable That Need To Be Replaced
//   } else {
//     clearTimetable();
//     isThereTimetable = false;
//     setTimeTable(classes);
//   }

//   isThereTimetable = true;
//   notifyListeners();
// }

// void clearTimetable() {
//   meetingService.clearTimetable();

//   dateInfo.forEach((key, meetings) {
//     for (int i = 0; i < meetings.length; i++) {
//       if (meetings[i].isCourse) {
//         dateInfo[key].removeAt(i);
//       }
//     }
//   });
// }
