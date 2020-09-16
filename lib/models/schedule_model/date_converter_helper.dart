int converToDay(String courseDay) {
  final today = DateTime.now();
  Map days = {
    'Sunday': 7,
    'Monday': 1,
    'Tuesday': 2,
    'Wednesday': 3,
    'Thursday': 4,
    'Friday': 5,
    'Saturday': 6,
  };
  List<String> weekDaysStr = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  List weekDaysArray = [
    [0, 1, 2, 3, 4],
    [-1, 0, 1, 2, 3],
    [-2, -1, 0, 1, 2],
    [-3, -2, -1, 0, 1],
    [-4, -3, -2, -1, 0],
    [-5, -4, -3, -2, -1],
    [-6, -5, -4, -3, -2],
  ];

  int courseD = days[courseDay];
  if (courseD == 7) //SUNDAY case
    courseD = 0;

  for (int i = 0; i < weekDaysStr.length; i++) {
    if (today.weekday == days[weekDaysStr[i]]) {
      return today.day + weekDaysArray[i][courseD];
    }
  }

  return 1;
}
