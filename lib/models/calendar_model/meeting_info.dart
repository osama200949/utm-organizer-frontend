import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MeetingInfo {
  String id;
  String uid;
  bool isCourse = false;
  String meetingTitle;
  String labelCategory;
  Color backgroundColor;
  Color lableColor;
  DateTime startTime;
  DateTime endTime;
  String location;
  String description;
  DateClass dateClass; // HELPER Class

  MeetingInfo(
      {this.id,
      this.uid,
      this.isCourse,
      this.backgroundColor,
      this.lableColor,
      this.meetingTitle,
      this.labelCategory,
      this.startTime,
      this.endTime,
      this.location,
      this.description}) {
    dateClass = DateClass(startTime: startTime, endTime: endTime);
  }

  MeetingInfo.fromJson(Map<String, dynamic> json)
      : this(
          id: (json["id"] is int) ? json["id"].toString() : json["id"],
          // id: json["id"],
          uid: json["uid"],
          isCourse: json["isCourse"],
          backgroundColor: (json["backgroundColor"] is String)
              ? Color(int.parse(json["backgroundColor"]))
              : Color(json["backgroundColor"]),
          lableColor: (json["lableColor"] is String)
              ? Color(int.parse(json["lableColor"]))
              : Color(json["lableColor"]),
          meetingTitle: json["meetingTitle"],
          labelCategory: json["labelCategory"],
          location: json["location"],
          description: json["description"],
          startTime: DateTime.parse(json['startTime']),
          endTime: DateTime.parse(json['endTime']),
        );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "isCourse": isCourse == null ? false : isCourse,
        "backgroundColor": backgroundColor.value,
        "lableColor": lableColor.value,
        "meetingTitle": meetingTitle,
        "labelCategory": labelCategory,
        "location": location,
        "description": description,
        "startTime": startTime.toString(),
        "endTime": endTime.toString(),
      };
}

// HELPER
class DateClass {
  DateTime startTime;
  DateTime endTime;

  DateClass({this.startTime, this.endTime});

  get from => DateFormat('hh:mm a').format(startTime);
  get to => DateFormat('hh:mm a').format(endTime);
  get completeDate => DateFormat('dd-MM-yyyy').format(startTime);

  get dateFrom => startTime;
  set dateFrom(DateTime newD) => startTime = newD;
  get dateTo => endTime;
  set dateTo(DateTime newD) => endTime = newD;
  get day => getDay(startTime.weekday);
  get dayNumber => startTime.day.toString();
  get year => startTime.year.toString();

  static const List<String> _days = ['Mo', 'T', 'W', 'Th', 'F', 'Sa', 'Su'];

  static String getDay(int day) {
    return day > 0 ? _days[day - 1] : ' ';
  }
}
