import 'class.dart';

class Doctor {
  String name;
  List<Class> classes;

  Doctor({this.name, this.classes});

  Doctor.fromJson(Map<String, dynamic> json)
      : this(
            name: json["name"],
            classes: (json["classes"] as List)
                .map((item) => Class.fromJson(item))
                .toList());

  Map<String, dynamic> toJson() =>
      {'name': name, 'classes': classes.map((c) => c.toJson()).toList()};
}

// class Doctor {
//   String name;
//   Map days;

//   Doctor({this.name, this.days});
// }
