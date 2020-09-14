import 'package:utm_orgnization/models/calendar_model/meeting_info.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/services/auth_services.dart';

import '../dependencies.dart';
import 'rest/rest_service.dart';

class MeetingService {

  String userID; //!TODO: uid --- Done on MeetingData
  
  final rest = service<RestService>();

  Future<List<MeetingInfo>> getAllMeetings() async {
    final result = await rest.get('meetings');
    return (result as List).map((e) => MeetingInfo.fromJson(e)).toList();
  }

  Future<List<MeetingInfo>> getUserMeetings() async {
    final result = await rest.get('meetings/$userID/calendar');
    return (result as List).map((e) => MeetingInfo.fromJson(e)).toList();
  }

  Future<MeetingInfo> getMeeting(String endPoint) async {
    final result = await rest.get(endPoint);
    print('result');
    print(result);
    return MeetingInfo.fromJson(result);
  }

  Future<MeetingInfo> createMeeting(MeetingInfo data) async {
    data.uid = userID;
    final result = await rest.post('meetings', data: data);

    print('post result');
    print(result);
    return MeetingInfo.fromJson(result);
  }

  Future deleteMeeting(String endpoint) async {
    await rest.delete(endpoint);
  }

  Future<MeetingInfo> updateMeeting(String endpoint, {MeetingInfo data}) async {
    data.uid = userID;
    final response = await rest.patch(endpoint, data: data);

    return MeetingInfo.fromJson(response);
  }

  Future clearTimetable() async {
    final response = await rest.delete('meetings/$userID/timetable');
    return MeetingInfo.fromJson(response);
  }
}

// final meetingService = MeetingService();
