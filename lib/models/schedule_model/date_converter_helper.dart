
  int converToDay(String courseDay) {
    final today = DateTime.now();
    int temp = 0;
    Map days = {
      'Sunday': 7,
      'Monday': 1,
      'Tuesday': 2,
      'Wednesday': 3,
      'Thursday': 4,
      'Friday': 5,
      'Saturday': 6,
    };
    List daysStr = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];

    final courseD = days[courseDay];

    if (today.weekday == days['Sunday']) {
      //check the course day in case of (SUNDAY)

      //courseD = 2 (Dynamic)
      if (courseD == days['Sunday']) {
        return today.day;
      } else if (courseD == days['Monday']) {
        return today.day + 1;
      } else if (courseD == days['Tuesday']) {
        return today.day + 2;
      } else if (courseD == days['Wednesday']) {
        return today.day + 3;
      } else {
        return today.day + 4;
      }
    }

    if (today.weekday == days['Monday']) {
      //check the course day in case of (MONDAY)

      if (courseD == days['Sunday']) {
        return today.day - 1;
      } else if (courseD == days['Monday']) {
        return today.day;
      } else if (courseD == days['Tuesday']) {
        return today.day + 1;
      } else if (courseD == days['Wednesday']) {
        return today.day + 2;
      } else {
        return today.day + 3;
      }
    }

    if (today.weekday == days['Tuesday']) {
      //check the course day in case of (TUESDAY)

      if (courseD == days['Sunday']) {
        return today.day - 2;
      } else if (courseD == days['Monday']) {
        return today.day - 1;
      } else if (courseD == days['Tuesday']) {
        return today.day;
      } else if (courseD == days['Wednesday']) {
        return today.day + 1;
      } else {
        return today.day + 2;
      }
    }

    if (today.weekday == days['Wednesday']) {
      //check the course day in case of (WEDNESDAY)

      if (courseD == days['Sunday']) {
        return today.day - 3;
      } else if (courseD == days['Monday']) {
        return today.day - 2;
      } else if (courseD == days['Tuesday']) {
        return today.day - 1;
      } else if (courseD == days['Wednesday']) {
        return today.day;
      } else {
        return today.day + 1;
      }
    }

    if (today.weekday == days['Thursday']) {
      //check the course day in case of (THURSDAY)

      if (courseD == days['Sunday']) {
        return today.day - 4;
      } else if (courseD == days['Monday']) {
        return today.day - 3;
      } else if (courseD == days['Tuesday']) {
        return today.day - 2;
      } else if (courseD == days['Wednesday']) {
        return today.day - 1;
      } else {
        return today.day;
      }
    }

    if (today.weekday == days['Friday']) {
      //check the course day in case of (FRIDAY)

      if (courseD == days['Sunday']) {
        return today.day - 5;
      } else if (courseD == days['Monday']) {
        return today.day - 4;
      } else if (courseD == days['Tuesday']) {
        return today.day - 3;
      } else if (courseD == days['Wednesday']) {
        return today.day - 2;
      } else {
        return today.day - 1;
      }
    }

    if (today.weekday == days['Saturday']) {
      //check the course day in case of (SATURDAY)

      if (courseD == days['Sunday']) {
        return today.day - 6;
      } else if (courseD == days['Monday']) {
        return today.day - 5;
      } else if (courseD == days['Tuesday']) {
        return today.day - 4;
      } else if (courseD == days['Wednesday']) {
        return today.day - 3;
      } else {
        return today.day - 2;
      }
    }


    return 1;
  }