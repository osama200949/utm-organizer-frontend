import 'package:get_it/get_it.dart';
import 'package:utm_orgnization/data/jsonData.dart';
import 'package:utm_orgnization/services/auth_services.dart';
import 'package:utm_orgnization/services/club_data_service.dart';
import 'package:utm_orgnization/services/meetings_service.dart';
import 'package:utm_orgnization/services/rest/rest_service.dart';
import 'package:utm_orgnization/services/schedule_service.dart';

GetIt service = GetIt.instance;

void init() {
  service.registerLazySingleton(
    () => RestService(),
  );
  service.registerLazySingleton(
    () => AuthServices(),
  );
  service.registerLazySingleton(
    () => ClubDataService(),
  );
  service.registerLazySingleton(
    () => MeetingService(),
  );
  service.registerLazySingleton(
    () => ScheduleService(),
  );
}
