import 'course.dart';

class Semester {
  final int number;
  final List<Course> courses;

  Semester({this.number, this.courses});

  Semester.fromJson(Map<String, dynamic> json)
      : this(
            number: json["number"],
            courses: (json["courses"] as List)
                .map((item) => Course.fromJson(item))
                .toList());
}

// class Semester {
//   final int number;
//   final Map courses;

//   Semester({this.number, this.courses});
// }
