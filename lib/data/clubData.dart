import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

import 'package:utm_orgnization/models/club_model/club.dart';
import 'package:utm_orgnization/services/club_data_service.dart';

import '../dependencies.dart';

class ClubData extends ChangeNotifier {
  List<Club> _clubs;

  // UnmodifiableListView<Club> get clubs {
  //   return UnmodifiableListView(_clubs);
  // }
  List<Club> get clubs => _clubs;

  set clubs(List<Club> clubs) {
    _clubs = clubs;
  }

  int get clubCount {
    return _clubs.length;
  }

  ClubData();
  ClubDataService get dataService => service();

  Future<List<Club>> getList() async {
    _clubs = await dataService.getClubs();
    print(_clubs);
    notifyListeners();
    return _clubs;
  }

  Future<void> addNewClub(Club club) async {
    final newClub = await dataService.createClub(club: club);
    _clubs.add(newClub);
    notifyListeners();
  }

  Future<void> updateClub(Club club, Club oldOne, String id) async {
    final newClub = await dataService.updateClub(club: club, id: id);
    _clubs.remove(oldOne);
    _clubs.add(newClub);

    notifyListeners();
  }

  Future<void> removeClub(int index) async {
    await dataService.deleteClub(clubId: _clubs[index].clubId);
    _clubs.removeAt(index);
    notifyListeners();
  }
}

List<ClubColor> ClubColors = [
  ClubColor(
    colorInt: 0xff464154,
    clicked: false,
  ),
  ClubColor(
    colorInt: 0xffDA5167,
    clicked: false,
  ),
  ClubColor(
    colorInt: 0xff45606F,
    clicked: false,
  ),
  ClubColor(
    colorInt: 0xffE04712,
    clicked: false,
  ),
];

class ClubColor {
  int colorInt;
  bool clicked;

  ClubColor({this.colorInt, this.clicked});
}
