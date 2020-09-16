import 'package:utm_orgnization/models/schedule_model/section.dart';

class Course {
  final String id;
  final String type;
  final String code;
  final String name;
  List<Section> sections;

  Course({this.id = '', this.type, this.name, this.sections, this.code}){
    this.id;
    print(this.id);
  }

  Course.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'] != null ? json['id'] : '',
            type: json['type'],
            code: json["code"],
            name: json["name"],
            sections: (json["sections"] as List)
                .map((item) => Section.fromJson(item))
                .toList());

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'sections': sections.map((s) => s.toJson()).toList()
      };
}

// class Course {
//   final String name;
//   final String code;
//   Map sections;

//   Course({this.name, this.sections, this.code});
// }
