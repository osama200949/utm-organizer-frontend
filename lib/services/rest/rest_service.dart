import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class RestService {
  // static const String baseUrl = 'http://192.168.56.1:3000';  //!Json-Server
  // static const String baseUrl =
  //     'https://us-central1-utm-organizer-backend.cloudfunctions.net/api/v1'; //!Remote
  static const String baseUrl =
      'http://10.0.2.2:5001/utm-organizer-backend/us-central1/api/v1'; //! Local emulator

  String idToken;

  Future get(String endPoint) async {
    print("id Token " + idToken);
    final response = await http.get(
      '$baseUrl/$endPoint',
      headers: {
        HttpHeaders.authorizationHeader: idToken,
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future post(String endPoint, {dynamic data}) async {
    final response = await http.post('$baseUrl/$endPoint',
        headers: {
          HttpHeaders.authorizationHeader: idToken,
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(data));
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future delete(String endPoint) async {
    final response = await http.delete(
      '$baseUrl/$endPoint',
      headers: {
        HttpHeaders.authorizationHeader: idToken,
      },
    );
    if (response.statusCode == 200) {
      return;
    }
    throw response;
  }

  Future patch(String endPoint, {dynamic data}) async {
    final response = await http.patch(
      '$baseUrl/$endPoint',
      headers: {
        HttpHeaders.authorizationHeader: idToken,
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }
}
