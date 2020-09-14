// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:utm_orgnization/models/schedule_model/course.dart';
// import 'package:utm_orgnization/models/schedule_model/major.dart';
// import 'package:utm_orgnization/services/rest/rest_service.dart';

// import '../dependencies.dart';

// class ScheduleService {

//   final rest = service<RestService>();

//   Future<List<Major>> getMajors() async {
//     // print('Fetching data from $url');

//     dynamic response = await rest.get('majors');

//     // while (response == null) {
//     //   response = await _get('majors');
//     // }
//     print(response);

//     final List<Major> majors =
//         (response as List).map((json) => Major.fromJson(json)).toList();
//     return majors;
//   }

//   Future<Course> addSelectedCourse(Course c) async {
//     final response = await rest.post('majors/selectedCourses', data: c.toJson());

//     return Course.fromJson(response);
//   }

//   Future<List<Course>> getSelectedCourses() async {
//     // print('Fetching data from $url/majors/selectedCourses');

//     dynamic response = await rest.get('majors/selectedCourses');

//     // response = await get(endpoint: 'selectedCourses');
//     print(response);

//     if (response != null) {
//       final List<Course> selectedCourses =
//           (response as List).map((json) => Course.fromJson(json)).toList();

//       print(selectedCourses);

//       return selectedCourses;
//     }
//     return [];
//   }

//   Future<Course> updateSelectedCourse(Course c) async {
//     final response = await rest.patch(
//         'majors/selectedCourses/${c.id}',data: {"sections": c.sections});

//     print("ScheduleService after update:\n $response");

//     return Course.fromJson(response);
//   }

//   Future removeSelectedCourse(Course c) async {
//     final response = await rest.delete('majors/selectedCourses/${c.id}');

//     print("Delete Response: \n");
//     print(response);

//     return null;
//   }

//   Future removeAllSelectedCourse() async {
//     final response = await rest.delete('majors/selectedCourses');

//     print("Delete Response: \n");
//     print(response);

//     return null;
//   }
// }



// //? Archieve
// // final dataService = ScheduleService();

//   // static const String url =
//   //     "https://run.mocky.io/v3/2806f3f3-2d6b-4118-8e62-4d03e66e2806";
//   // static const String url =
//   //     "http://10.0.2.2:5001/utm-organizer-backend/us-central1";
//   // static const String url =
//   //     "https://us-central1-utm-organizer-backend.cloudfunctions.net/api/v1";

//   // Future _get(String endpoint) async {
//   //   try {
//   //     final response = await http
//   //         .get('$url/$endpoint', headers: {'Content-Type': 'application/json'});
//   //     print("${response.statusCode} ${response.reasonPhrase}");
//   //     // print(response.body);

//   //     if (response.statusCode == 200) {
//   //       // print(jsonDecode(response.body));
//   //       return jsonDecode(response.body);
//   //     }
//   //     throw response;
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   // Future _post(String endpoint, {dynamic data}) async {
//   //   try {
//   //     final response = await http.post('$url/$endpoint',
//   //         headers: {'Content-Type': 'application/json'},
//   //         body: jsonEncode(data));

//   //     print("${response.statusCode} ${response.reasonPhrase}");
//   //     // print(response.body);

//   //     if (response.statusCode == 201) {
//   //       // print(jsonDecode(response.body));
//   //       return jsonDecode(response.body);
//   //     }
//   //     throw response;
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   // Future _patch(String endpoint, dynamic data) async {
//   //   try {
//   //     final response =
//   //         await http.patch('$url/$endpoint', body: jsonEncode(data));

//   //     // print(jsonDecode(response.body));

//   //     print("${response.statusCode} ${response.reasonPhrase}");
//   //     print(response.body);

//   //     if (response.statusCode == 200) {
//   //       // print(jsonDecode(response.body));
//   //       return jsonDecode(response.body);
//   //     }
//   //     throw response;
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   // Future _delete(String endpoint) async {
//   //   try {
//   //     final response = await http.delete('$url/$endpoint');

//   //     // print(jsonDecode(response.body));

//   //     print("${response.statusCode} ${response.reasonPhrase}");
//   //     print(response.body);

//   //     if (response.statusCode == 200) {
//   //       // print(jsonDecode(response.body));
//   //       return jsonDecode(response.body);
//   //     }
//   //     throw response;
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
