import 'package:utm_orgnization/models/club_model/club_category.dart';
import 'package:utm_orgnization/utils/constants.dart';

List<ClubCategory> categories = [
  ClubCategory(
    categoryTitle: "Sport",
    categotyIconPath: "images/icons/award.svg",
  ),
  ClubCategory(
    categoryTitle: "Culture",
    categotyIconPath: "images/icons/Culture.svg",
  ),
  ClubCategory(
    categoryTitle: "Media",
    categotyIconPath: "images/icons/media.svg",
  ),
  ClubCategory(
    categoryTitle: "Tech",
    categotyIconPath: "images/icons/code.svg",
  ),
  ClubCategory(
    categoryTitle: "Soical",
    categotyIconPath: "images/icons/soical.svg",
  ),
  ClubCategory(
    categoryTitle: "Others",
    categotyIconPath: "images/icons/soical.svg",
  ),
];
Map<String,ClubCategory>  eventCategories = {
  "Sport":
  ClubCategory(
    categoryTitle: "Sport",
    categotyIconPath: "images/icons/award.svg",
    color: eventColors[0],
    secondary: eventSecondaryColors[0],
    categoryIscliked: false,
  ),
  "Culture":
  ClubCategory(
    categoryTitle: "Culture",
    categotyIconPath: "images/icons/Culture.svg",
    color: eventColors[1],
    secondary: eventSecondaryColors[1],
    categoryIscliked: false,
  ),
  "Media":
  ClubCategory(
    categoryTitle: "Media",
    categotyIconPath: "images/icons/media.svg",
    color: eventColors[5],
    secondary: eventSecondaryColors[5],
    categoryIscliked: false,
  ),
  "Tech":
  ClubCategory(
    categoryTitle: "Tech",
    categotyIconPath: "images/icons/code.svg",
    color: eventColors[2],
    secondary: eventSecondaryColors[2],
    categoryIscliked: false,
  ),
  "Social":
  ClubCategory(
    categoryTitle: "Social",
    categotyIconPath: "images/icons/soical.svg",
    color: eventColors[3],
    secondary: eventSecondaryColors[3],
    categoryIscliked: false,
  ),
  "Others":
  ClubCategory(
    categoryTitle: "Others",
    categotyIconPath: "images/icons/soical.svg",
    color: eventColors[4],
    secondary: eventSecondaryColors[4],
    categoryIscliked: false,
  ),
};
