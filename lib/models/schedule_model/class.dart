import 'package:utm_orgnization/models/schedule_model/time.dart';

class Class {
  DateTime startTime;
  DateTime endTime;
  String day;
  String venue;

  Class({this.startTime, this.endTime, this.day,this.venue});

  Class.fromJson(Map<String, dynamic> json)
      : this(
          startTime: DateTime.parse(json["startTime"]),
          endTime: DateTime.parse(json["endTime"]),
          day: json["day"],
          venue: json["venue"] !=null ? json["venue"] : "Not specified",
        );

  Map<String, dynamic> toJson() => {
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
        'day': day,
        'venue': venue
      };
}

// class Day {
//   String name;
//   Time time;

//   Day({this.name, this.time});
// }
