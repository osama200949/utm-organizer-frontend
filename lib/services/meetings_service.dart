import 'package:utm_orgnization/models/calendar_model/meeting_info.dart';
import '../dependencies.dart';
import 'rest/rest_service.dart';

class MeetingService {
  String userID; //!TODO: uid --- Done on MeetingProvider

  final rest = service<RestService>();

  Map<String, dynamic> hashMap = Map();

  //? unused
  Future<List<MeetingInfo>> getAllMeetings() async {
    final result = await rest.get('meetings');
    return (result as List).map((e) => MeetingInfo.fromJson(e)).toList();
  }

  Future<List<MeetingInfo>> getUserMeetings() async {
    if (!hashMap.containsKey(userID)) {
      final result = await rest.get('meetings/userCalendar/$userID');
      hashMap[userID] = result;
      return (result as List).map((e) => MeetingInfo.fromJson(e)).toList();
    }
    return (hashMap[userID] as List)
        .map((e) => MeetingInfo.fromJson(e))
        .toList();
  }

  //? unused
  Future<MeetingInfo> getMeeting(String endPoint) async {
    final result = await rest.get(endPoint);
    print('result');
    print(result);
    return MeetingInfo.fromJson(result);
  }

  Future<MeetingInfo> createMeeting(MeetingInfo data) async {
    data.uid = userID;
    final result = await rest.post('meetings', data: data);
    MeetingInfo meeting = MeetingInfo.fromJson(result);

    hashMap[meeting.id] = meeting;

    return meeting;
  }

  Future deleteMeeting(String endpoint) async {
    final meetingEndpoint = endpoint.split('/');
    final meetingId = meetingEndpoint[1];
    hashMap.remove(meetingId);
    await rest.delete(endpoint);
  }

  Future<MeetingInfo> updateMeeting(String endpoint, {MeetingInfo data}) async {
    data.uid = userID;
    final result = await rest.patch(endpoint, data: data);

    MeetingInfo meeting = MeetingInfo.fromJson(result);
    hashMap[meeting.id] = meeting;

    return MeetingInfo.fromJson(result);
  }

  //? unused
  Future clearTimetable() async {
    final response = await rest.delete('meetings/$userID/timetable');
    return MeetingInfo.fromJson(response);
  }
}

// final meetingService = MeetingService();
