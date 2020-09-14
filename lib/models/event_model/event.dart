import 'package:flutter/cupertino.dart';
import 'package:utm_orgnization/data/data.dart';
import 'package:utm_orgnization/models/club_model/club_category.dart';
import 'package:utm_orgnization/models/user.dart';

class Event {
  String eventId;
  String eventName;
  String eventStartTime;
  String eventEndTime;
  String eventStartDate;
  String eventEndDate;
  String eventDescription;
  String eventPhone;
  String imageURL;  
  String eventCategory;
  List<String> eventInterster;
  final Color colorPramiry;
  final Color colorSecondary;
  String ticketPrice;
  String registrationForm;
  final ClubCategory category;
  String eventLocation;

  Event(
      {this.eventName,
      this.eventDescription,
      this.eventId,
      this.imageURL,
      this.eventInterster,
      this.eventPhone,
      this.eventCategory,
      this.eventStartTime,
      this.eventEndTime,
      this.eventStartDate,
      this.eventEndDate,
      this.category,
      this.colorPramiry,
      this.colorSecondary,
      this.ticketPrice,
      this.eventLocation,
      this.registrationForm});

  Map<String, dynamic> toJson() => {
        'eventName': eventName,
        'eventDescription': eventDescription,
        'eventStartTime': eventStartTime,
        'eventEndTime': eventEndTime,
        'eventStartDate': eventStartDate,
        'eventEndDate': eventEndDate,
        'eventPhone': eventPhone,
        'eventCategory': eventCategory,
        'imageURL': imageURL,
        'ticketPrice' : ticketPrice,
        'eventLocation' : eventLocation,
        'registrationForm' : registrationForm,
        'eventInterster': []
      };
}
