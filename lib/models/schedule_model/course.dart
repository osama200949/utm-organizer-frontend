import 'package:utm_orgnization/models/schedule_model/section.dart';

class Course {
  final String id;
  String userID;
  final String type;
  final String code;
  final String name;
  List<Section> sections;

  Course({this.id = '',this.userID, this.type, this.name, this.sections, this.code});

  Course.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'] != null ? json['id'] : '',
            userID: json['userID'] ,
            type: json['type'],
            code: json["code"],
            name: json["name"],
            sections: (json["sections"] as List)
                .map((item) => Section.fromJson(item))
                .toList());

  Map<String, dynamic> toJson() => {
        'id': id,
        'userID': userID,
        'code': code,
        'name': name,
        'sections': sections.map((s) => s.toJson()).toList()
      };

      // set setUserId(String userID) => this.userID = userID;
}