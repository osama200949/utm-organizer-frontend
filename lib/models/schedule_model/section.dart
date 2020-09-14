import 'doctor.dart';

class Section {
  final int number;
  final Doctor doctor;
  bool isPressed;

  Section({this.number, this.doctor, this.isPressed = false});

  Section.fromJson(Map<String, dynamic> json)
      : this(
          number: json["number"],
          doctor: Doctor.fromJson(json["doctor"]),
        );

  Map<String, dynamic> toJson() =>
      {'number': number, 'isPressed': isPressed, 'doctor': doctor.toJson()};
}

// class Section {
//   final String number;
//   final Doctor doctor;
//   bool isPressed;

//   Section({this.number, this.doctor, this.isPressed = false});
// }

// class Section {
//   // final int number;
//   final Doctor doctor;
//   bool isPressed;

//   Section({this.doctor, this.isPressed = false});
// }
