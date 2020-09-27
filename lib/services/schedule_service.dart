import 'package:utm_orgnization/models/schedule_model/course.dart';
import 'package:utm_orgnization/models/schedule_model/major.dart';
import 'package:utm_orgnization/services/rest/rest_service.dart';

import '../dependencies.dart';

class ScheduleService {
  final rest = service<RestService>();
  Map<String, dynamic> hashMap = Map();

  String userID;

  Future<List<Course>> getUserSelectedCourses() async {
    if (!hashMap.containsKey(userID)) {
      final result = await rest.get('meetings/allUserSelectedCourses/$userID');
      hashMap[userID] = result;
      return (result as List).map((e) => Course.fromJson(e)).toList();
    }
    return (hashMap[userID] as List).map((e) => Course.fromJson(e)).toList();
  }

  Future<List<Major>> getMajors() async {
    // print('Fetching data from $url');

    dynamic response = await rest.get('majors');

    // while (response == null) {
    //   response = await _get('majors');
    // }
    print(response);

    final List<Major> majors =
        (response as List).map((json) => Major.fromJson(json)).toList();
    return majors;
  }

  Future<Course> addSelectedCourse(Course c) async {
    final response =
        await rest.post('majors/selectedCourses', data: c.toJson());

    return Course.fromJson(response);
  }

  Future<List<Course>> getSelectedCourses() async {
    dynamic response = await rest.get('majors/allUserSelectedCourses/$userID');
    print(response);
    final List<Course> selectedCourses =
        (response as List).map((json) => Course.fromJson(json)).toList();

    print(selectedCourses);

    return selectedCourses;
  }

  Future<Course> updateSelectedCourse(Course c) async {
    final response = await rest.patch('majors/selectedCourses/${c.id}',
        data: {"sections": c.sections});

    print("ScheduleService after update:\n $response");

    return Course.fromJson(response);
  }

  Future<void> removeSelectedCourse(Course c) async {
    final response = await rest.delete('majors/selectedCourses/${c.id}');

    print("Delete Response: \n");
    print(response);

    return null;
  }

  Future removeAllSelectedCourse() async {
    final response = await rest.delete('majors/selectedCourses');

    print("Delete Response: \n");
    print(response);

    return null;
  }
}
