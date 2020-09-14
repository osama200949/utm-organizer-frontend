import 'package:utm_orgnization/models/club_model/club.dart';
import 'package:utm_orgnization/services/rest/rest_service.dart';

import '../dependencies.dart';

class ClubDataService {
  final rest = service<RestService>();

  Future<List<Club>> getClubs() async {
    final listJson = await rest.get('clubs');
    print(listJson);
    var s =
        (listJson as List).map((itemJson) => Club.fromJson(itemJson)).toList();
    print(s);
    return s;
  }

  Future<List<Club>> getUserClubList({int uid}) async {
    final listJson = await rest.get('clubs?uid=$uid');
    return (listJson as List)
        .map((itemJson) => Club.fromJson(itemJson))
        .toList();
  }

  Future<Club> createClub({Club club}) async {
    final json = await rest.post('clubs', data: club);
    print(json);
    return Club.fromJson(json);
  }

  Future<Club> updateClub({String id, Club club}) async {
    final json = await rest.patch('clubs/$id', data: club.toJson());
    return Club.fromJson(json);
  }

  Future deleteClub({String clubId}) async {
    await rest.delete('clubs/$clubId');
  }
}
