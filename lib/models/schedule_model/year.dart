import 'package:utm_orgnization/models/schedule_model/semester.dart';

class Year {
  final int number;
  final List<Semester> semesters;

  Year({this.number, this.semesters});

  Year.fromJson(Map<String, dynamic> json)
      : this(
            number: json["number"],
            semesters: (json["semesters"] as List)
                .map((item) => Semester.fromJson(item))
                .toList());
}

// class Year {
// final String number;
//   final Map semesters;

//   Year({this.semesters});
// }
