import 'package:flutter/material.dart';
import 'package:utm_orgnization/dependencies.dart';
import 'package:utm_orgnization/models/schedule_model/course.dart';
import 'package:utm_orgnization/models/schedule_model/date_converter_helper.dart';
import 'package:utm_orgnization/models/schedule_model/major.dart';
import 'package:utm_orgnization/models/schedule_model/major_box.dart';
import 'package:utm_orgnization/models/schedule_model/semester.dart';
import 'package:utm_orgnization/models/schedule_model/year.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/screens/schedule_screen/class_info.dart';
import 'package:utm_orgnization/services/schedule_service.dart';
import 'package:utm_orgnization/utils/constants.dart';

class ScheduleProvider extends ChangeNotifier {
  final secheduleService = service<ScheduleService>();
  List<String> yearsText = [
    "All",
    "Fisrt",
    "Second",
    "Third",
    "Fourth",
  ];

  List<String> others = [
    "Recommended Courses",
    "Co-Curriculum",
    "Language Courses"
  ];

  List<MajorBox> majorBox = [];

  int currentMajor = 0;
  int currentYearindex = -1;
  int currentSem = 0;
  int currentCourse;
  int othersIndex = 0;
  int currentSection = -1;
  List<Course> _allSem = [];
  Year currentYear;
  List<int> numbers = [0, 1, 2, 3, 4, 5, 6];

  //! FETCH DATA FROM API
  bool isClashed = false;
  List<Year> yearData;
  List<Major> majors;
  List<Course> allCourseData = [];
  List<ClassInfo> classes = [];
  List<Course> selectedCourses = [];
  bool isThereIsTimetable = false;

  User _user;
  get user => _user;
  set user(User newUser) {
    _user = newUser;
    setDataFromDatabase();
    notifyListeners();
  }

  Future<void> setDataFromDatabase() async {
    if (_user == null) return;
    secheduleService.userID = _user.uid;

    try {
      majors = await secheduleService.getMajors();
    } catch (e) {
      majors = null;
    }
    try {
      selectedCourses = await secheduleService.getSelectedCourses();
    } catch (e) {
      selectedCourses = [];
    }
    yearData = majors[currentMajor].years;

    setMajorBox();

    notifyListeners();
  }

  List<ClassInfo> get getClasses => classes;

  set setIsClashed(bool b) => isClashed = b;

  bool isClash() {
    setDataSource();

    if (classes.length <= 1) return false;

    for (int i = 0; i < classes.length; i++) {
      for (int j = i + 1; j < classes.length; j++) {
        if (!classes[i].startTime.isAtSameMomentAs(classes[j].startTime)) {
          if (classes[i].startTime.day == classes[j].startTime.day) {
            if (classes[i].startTime.hour < classes[j].startTime.hour ||
                classes[j].startTime.hour < classes[i].startTime.hour) {
              if (classes[i].startTime.hour >= classes[j].endTime.hour ||
                  classes[j].startTime.hour >= classes[i].endTime.hour) {
                continue;
              } else
                return true;
            }
          }
        } else
          return true;
      } //end j
    } //end i

    return false;
  }

  final today = DateTime.now();

  void setDataSource() {
    classes = [];
    for (int i = 0; i < selectedCourses.length; i++)
      for (int j = 0;
          j < selectedCourses[i].sections[0].doctor.classes.length;
          j++) {
        classes.add(
          ClassInfo(
            name: selectedCourses[i].name,
            code: selectedCourses[i].code,
            section: selectedCourses[i].sections[0].number.toString(),
            doctorName: selectedCourses[i].sections[0].doctor.name,
            startTime: DateTime(
                today.year,
                today.month,
                converToDay(
                    selectedCourses[i].sections[0].doctor.classes[j].day),
                selectedCourses[i]
                    .sections[0]
                    .doctor
                    .classes[j]
                    .startTime
                    .hour),
            endTime: DateTime(
                today.year,
                today.month,
                converToDay(
                    selectedCourses[i].sections[0].doctor.classes[j].day),
                selectedCourses[i].sections[0].doctor.classes[j].endTime.hour),
            bgColor:
                timetableColors[i] != null ? timetableColors[i] : Colors.green,
          ),
        );
      }

    notifyListeners();
  }

  List<Course> getAllData() {
    allCourseData.clear();
    for (Year year in yearData) {
      for (Semester sem in year.semesters) {
        for (Course course in sem.courses) {
          switch (othersIndex) {
            case 0:
              if (course.type == "recommended") allCourseData.add(course);
              break;

            case 1:
              if (course.type == "co-q") allCourseData.add(course);
              break;

            case 2:
              if (course.type == "language") allCourseData.add(course);
              break;
          }
        }
      }
    }

    for (int i = 0; i < allCourseData.length; i++) {
      for (int j = 0; j < selectedCourses.length; j++) {
        if (allCourseData[i].code == selectedCourses[j].code) {
          for (int z = 0; z < allCourseData[i].sections.length; z++) {
            if (allCourseData[i].sections[z].number ==
                selectedCourses[j].sections[0].number) {
              allCourseData[i].sections[z].isPressed = true;
            }
          }
        }
      }
    }
    return allCourseData;
  }

  Future<void> addCourse(Course c) async {
    c.userID = _user.uid;
    bool present = false;
    Course cs = Course(
      userID: c.userID,
      type: c.type,
      name: c.name,
      code: c.code,
      sections: [c.sections[currentSection]],
    );
    for (int i = 0; i < selectedCourses.length; i++) {
      if (selectedCourses[i].code == cs.code) {
        present = true;
        break;
      }
    }
    try {
      if (!present) {
        final result = await secheduleService.addSelectedCourse(cs);
        selectedCourses.add(result);
      } else
        await updateCourse(c);
    } catch (e) {
      throw e;
    }

    notifyListeners();
  }

  void updateCourse(Course c) async {
    for (int i = 0; i < selectedCourses.length; i++) {
      if (c.code == selectedCourses[i].code) {
        selectedCourses[i].sections = [c.sections[currentSection]];
        await secheduleService.updateSelectedCourse(selectedCourses[i]);
      }
    }
  }

  void setIsPressed(Course c) {
    allCourseData.forEach((element) {
      if (c.code == element.code)
        element.sections[c.sections[0].number - 1].isPressed = false;
    });
    notifyListeners();
  }

  Future<void> removeCourse(
      {@required Course course, @required int index}) async {
    for (int i = 0; i < selectedCourses.length; i++) {
      if (selectedCourses[i].code == course.code) {
        try {
          await secheduleService.removeSelectedCourse(selectedCourses[i]);
          setIsPressed(selectedCourses[i]);
          selectedCourses.removeAt(i);
        } catch (e) {
          throw e;
        }
      }
    }

    notifyListeners();
  }

//! SELECTED COURSES
  get selectedCoursesLength => selectedCourses.length;

  String getSelectedCourses() {
    return selectedCourses[0].name;
  }

  int getCoursesLength() {
    if (currentYearindex == -1)
      return getAllData().length;
    else
      return getCourses(currentYearindex).length;
  }

  List<Course> getCourses(int yearIndex) {
    _allSem.clear();

    for (int i = 0; i < yearData[yearIndex].semesters.length; i++) {
      for (int j = 0;
          j < yearData[yearIndex].semesters[i].courses.length;
          j++) {
        switch (othersIndex) {
          case 0:
            if (yearData[yearIndex].semesters[i].courses[j].type ==
                'recommended') {
              _allSem.add(yearData[yearIndex].semesters[i].courses[j]);
            }
            break;
          case 1:
            if (yearData[yearIndex].semesters[i].courses[j].type == 'co-q') {
              _allSem.add(yearData[yearIndex].semesters[i].courses[j]);
            }
            break;
          case 2:
            if (yearData[yearIndex].semesters[i].courses[j].type ==
                'language') {
              _allSem.add(yearData[yearIndex].semesters[i].courses[j]);
            }
            break;
        }
      }
    }

    return _allSem;
  }

  Course getCourse(int index) {
    if (currentYearindex == -1)
      return allCourseData[index];
    else
      return getCourses(currentYearindex)[index];
  }

  set setCurrentCourse(int index) => currentCourse = index;

  bool isMajorPressed(int index) {
    return currentMajor == index ? true : false;
  }

  void setCurrentMajor(int index) {
    currentMajor = index;
    notifyListeners();
  }

  void setMajorBox() {
    majorBox.clear();
    for (int i = 0; i < majors.length; i++) {
      majorBox.add(
        MajorBox(
          index: i,
          boxColor: Color(0xffF5F5F5),
          boxText: majors[i].course,
          textColor: Colors.black,
        ),
      );
    }
  }
} //?end

//! ARCHIEVE

// int initialYear() {
//   return (currentSem / 2).ceil();
// }

// class SemNumber extends StatelessWidget {
//   SemNumber({this.number, this.numberColor, this.size});
//   int number;
//   Color numberColor;
//   double size;
//   void setColor(Color newColor) {
//     numberColor = newColor;
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (number == 0) {
//       setColor(Colors.red);
//       setColor(Colors.black);
//       return Text(
//         '$number',
//         style: TextStyle(fontSize: 50, color: numberColor),
//       );
//     } else if (number == 1) {
//       setColor(Colors.red);
//       // setColor(Colors.black);
//       return Text(
//         '$number',
//         style: TextStyle(fontSize: 50, color: numberColor),
//       );
//     }
//   }
// }

// List<SemNumber> sem = [
//   SemNumber(
//     number: 1,
//     numberColor: Colors.black,
//     size: 60,
//   ),
//   SemNumber(
//     number: 2,
//     numberColor: Colors.black,
//     size: 60,
//   ),
//   SemNumber(
//     number: 3,
//     numberColor: Colors.black,
//     size: 60,
//   ),
//   SemNumber(
//     number: 4,
//     numberColor: Colors.red,
//     size: 75,
//   ),
//   SemNumber(
//     number: 5,
//     numberColor: Colors.black,
//     size: 60,
//   ),
//   SemNumber(
//     number: 6,
//     numberColor: Colors.black,
//     size: 60,
//   ),
//   SemNumber(
//     number: 7,
//     numberColor: Colors.black,
//     size: 60,
//   ),
//   SemNumber(
//     number: 8,
//     numberColor: Colors.black,
//     size: 60,
//   ),
// ];

// Widget printSemster(int i) {
//   return sem[i];
// }

// void semChange(int newIndex) {
//   for (int i = 0; i < sem.length; i++) {
//     sem[i].setColor(Colors.black);
//   }

//   sem[newIndex].setColor(Colors.red);
// }

// void numChange(int index) {
//   for (int i = 0; i < sem.length; i++) {
//     sem[i].size = 60;
//   }

//   sem[index].size = 75;
//   currentSem = index + 1;
//   print(currentSem);
// }

// MajorBox(
//   index: 0,
//   boxColor: Color(0xffF5F5F5),
//   boxText: 'Network & Security',
//   textColor: Colors.black,
// ),
// MajorBox(
//   index: 1,
//   boxColor: Color(0xffD63447),
//   boxText: 'Software Engineering',
//   textColor: Colors.white,
// ),
// MajorBox(
//   index: 2,
//   boxColor: Color(0xffF5F5F5),
//   boxText: 'Graphics & Multimedia',
//   textColor: Colors.black,
// ),
// MajorBox(
//   index: 3,
//   boxColor: Color(0xffF5F5F5),
//   boxText: 'Data Engineering',
//   textColor: Colors.black,
// ),

//today.weekday = Monday = 1
//courseDay = Tuesday = 2

// if (today.weekday == days[courseDay])
//   return today.day + 2;
// else if (courseDay == 'Sunday') {
//   temp = days[courseDay] - today.weekday;
//   return (temp + today.day) - 7;
// } else if (today.weekday > days[courseDay]) {
//   temp = today.weekday - days[courseDay];
//   return today.subtract(Duration(days: temp)).day;
// } else if (today.day < days[courseDay]) {
//   temp = days[courseDay] - today.weekday;
//   return today.add(Duration(days: temp)).day;
// } else if (today.day > days[courseDay]) {
//   temp =
//       today.add(Duration(days: days[courseDay] - today.weekday)).day - today.day;
//   return today.add(Duration(days: temp)).day;
// } else {
//   print("schedule_data.dart: All conditions false: day is set to THURSDAY");
//   return days['Thursday'];
// }

// void undo(int section) {
//   selectedCourses[currentCourse].sections[section].isPressed = false;
//   removeCourse(selectedCourses[currentCourse]);
//   // isClash();
// }

// void unselect(Course c) {
//   for (int i = 0; i < selectedCourses.length; i++) {
//     if (c.code == selectedCourses[i].code) {
//       for (int j = 0; j < selectedCourses[i].sections.length; j++) {
//         if (c.sections[0].number == selectedCourses[i].sections[j].number) {
//           selectedCourses[i].sections[j].isPressed = false;
//           break;
//         }
//       }
//       break;
//     }
//   }
//   removeCourse(c);
// }
// Future<void> setUserSelectedCourses() async {
//   if (_user == null) return;
//   secheduleService.userID = _user.uid;
//   final courses = await secheduleService.getUserSelectedCourses();

//   bool isExist = true;
//   courses.forEach((dCourse) {
//     selectedCourses.forEach((sCourse) {
//       if (dCourse.code == sCourse.code) isExist = false;
//     });
//     if (!isExist) selectedCourses.add(dCourse);
//     isExist = true;
//   });

//   print('selected courses from server');
//   print(courses);
//   notifyListeners();
// }

// Future<void> clearAll() async {
//   await secheduleService.removeAllSelectedCourse();
//   selectedCourses.map((course) {
//     course.sections.map((section) {
//       if (section.isPressed) {
//         section.isPressed = false;
//         removeCourse(course);
//       }
//     });
//   });

// selectedCourses.clear();

//   classes.clear();
//   // getData();
//   notifyListeners();
// }