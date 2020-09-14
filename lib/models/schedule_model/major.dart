import 'package:utm_orgnization/models/schedule_model/year.dart';

class Major {
  final String course;
  final List<Year> years;

  Major({this.course, this.years});

  Major.fromJson(Map<String, dynamic> json)
      : this(
            course: json["course"],
            years: (json["years"] as List)
                .map((item) => Year.fromJson(item))
                .toList());
}
