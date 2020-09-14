import 'package:utm_orgnization/models/schedule_model/time.dart';

class Class {
  DateTime startTime;
  DateTime endTime;
  String day;

  Class({this.startTime, this.endTime, this.day});

  Class.fromJson(Map<String, dynamic> json)
      : this(
          startTime: DateTime.parse(json["startTime"]),
          endTime: DateTime.parse(json["endTime"]),
          day: json["day"],
        );

  Map<String, dynamic> toJson() => {
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
        'day': day
      };
}

// class Day {
//   String name;
//   Time time;

//   Day({this.name, this.time});
// }
