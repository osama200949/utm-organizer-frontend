
import 'package:utm_orgnization/models/schedule_model/course.dart';
import 'package:utm_orgnization/models/schedule_model/major.dart';
import 'package:utm_orgnization/services/rest/rest_service.dart';

import '../dependencies.dart';

class ScheduleService {

  final rest = service<RestService>();

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
    final response = await rest.post('majors/selectedCourses', data: c.toJson());

    return Course.fromJson(response);
  }

  Future<List<Course>> getSelectedCourses() async {
    // print('Fetching data from $url/majors/selectedCourses');

    dynamic response = await rest.get('majors/selectedCourses');

    // response = await get(endpoint: 'selectedCourses');
    print(response);

    if (response != null) {
      final List<Course> selectedCourses =
          (response as List).map((json) => Course.fromJson(json)).toList();

      print(selectedCourses);

      return selectedCourses;
    }
    return [];
  }

  Future<Course> updateSelectedCourse(Course c) async {
    final response = await rest.patch(
        'majors/selectedCourses/${c.id}',data: {"sections": c.sections});

    print("ScheduleService after update:\n $response");

    return Course.fromJson(response);
  }

  Future removeSelectedCourse(Course c) async {
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