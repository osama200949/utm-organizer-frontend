int converToDay(String courseDay) {
  courseDay = courseDay.toLowerCase();
  final today = DateTime.now();
  Map days = {
    'sunday': 7,
    'monday': 1,
    'tuesday': 2,
    'wednesday': 3,
    'thursday': 4,
    'friday': 5,
    'saturday': 6,
  };
  List<String> weekDaysStr = [
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday'
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
