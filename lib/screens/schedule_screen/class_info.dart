import 'package:flutter/material.dart';

class ClassInfo {
  String code;
  String name;
  String section;
  String doctorName;
  DateTime startTime;
  DateTime endTime;
  Color bgColor;

  ClassInfo(
      {this.code,
      this.name,
      this.section,
      this.startTime,
      this.endTime,
      this.doctorName,
      this.bgColor = Colors.green});
}
