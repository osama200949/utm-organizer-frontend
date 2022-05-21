import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/components/canvas/Canves_splash.dart';
import 'package:utm_orgnization/data/clubData.dart';
import 'package:utm_orgnization/data/club_category_data.dart';
import 'package:utm_orgnization/models/club_model/club.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/utils/constants.dart';

class EditScreenWalkthrow extends StatefulWidget with ChangeNotifier {
  Club club;
  String url;
  EditScreenWalkthrow({
    this.club,
  });

  int colorHexa;
  File _image;

  _EditScreenWalkthrowState createState() => _EditScreenWalkthrowState();
}

class _EditScreenWalkthrowState extends State<EditScreenWalkthrow> {
  TextEditingController controllerclubName;
  TextEditingController controllerclubDescriparion;
  TextEditingController controllerfacebookPath;
  TextEditingController controllerphoneNumber;

  @override
  void initState() {
    controllerclubName = TextEditingController(text: widget.club.clubName);
    controllerclubDescriparion =
        TextEditingController(text: widget.club.clubDescription);
    controllerfacebookPath =
        TextEditingController(text: widget.club.facebookPath);
    controllerphoneNumber =
        TextEditingController(text: this.widget.club.clubPhone);
    this.widget.colorHexa = this.widget.club.colorHexa;
    // value = Provider.of<ClubData>(context).clubs.indexOf(widget.club.categoryClub);
    imagePath = null;
    for (int i = 0; i < ClubColors.length; i++)
      if (widget.colorHexa == ClubColors[i].colorInt)
        ClubColors[i].clicked = true;

    for (int i = 0; i < categories.length; i++)
      if (widget.club.categoryClub == categories[i].categoryTitle) {
        value = i;
        print(widget.club.categoryClub);
        print(categories[i].categoryTitle);
        break;
      } else {
        print(widget.club.categoryClub);
        print(categories[i].categoryTitle);
        value = 0;
      }

    super.initState();
  }

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int value; // forcategory
  String imagePath;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 13.0,
      decoration: BoxDecoration(
        color: isActive ? kOrange_primary : kgrey_primary,
        borderRadius: BorderRadius.all(
          isActive ? Radius.circular(12) : Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future _getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      widget._image = image;
      String url;
      try {
        DateTime now = new DateTime.now();
        var datestamp = new DateFormat("yyyyMMdd'T'HHmmss");
        String currentdate = datestamp.format(now);
        File imageFile = widget._image;

        StorageReference ref = FirebaseStorage.instance
            .ref()
            .child("clubs")
            .child("$currentdate.jpg");
        StorageUploadTask uploadTask = ref.putFile(imageFile);
        var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
        url = dowurl.toString();
      } catch (error) {
        print(error);
      }
      this.widget.url = url;
      setState(
        () {
          print(widget.url);
          print(url);
          print('image ${widget._image}');
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(
            children: <Widget>[
              CanvaSplash(),
              _currentPage != _numPages - 1
                  ? Align(
                      alignment: FractionalOffset.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Next',
                                style: kPrimary_heading_2.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(" "),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 15, 0),
                          child: Text(
                            'Cancle',
                            style: kPrimary_heading_2.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.84,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(
                            () {
                              _currentPage = page;
                            },
                          );
                        },
                        children: <Widget>[
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Update club ",
                                      style: kPrimary_heading_2.copyWith(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    SvgPicture.asset(
                                      "images/icons/club.svg",
                                      color: Colors.white,
                                      height: 45,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12, 15, 10, 0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 15),
                                            child: Text(
                                              'Club info',
                                              style: kPrimary_heading.copyWith(
                                                color: kgrey_primary,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            controller: controllerclubName,
                                            decoration: InputDecoration(
                                              labelText: "Club Name",
                                              focusColor: Colors.black,
                                            ),
                                            maxLength: 60,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: "Club Description",
                                              focusColor: Colors.black,
                                            ),
                                            keyboardType: TextInputType.text,
                                            autofocus: false,
                                            maxLines: null,
                                            maxLength: 300,
                                            controller:
                                                controllerclubDescriparion,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: "Phone Number",
                                              helperText:
                                                  "Number of club representative",
                                              hintText: "013xxxxx",
                                              focusColor: Colors.black,
                                            ),
                                            keyboardType: TextInputType.phone,
                                            autofocus: false,
                                            maxLines: null,
                                            maxLength: 12,
                                            controller: controllerphoneNumber,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: "Club facebook page",
                                              hintText: "utmacestoastmaster",
                                              focusColor: Colors.black,
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            autofocus: false,
                                            maxLength: 50,
                                            controller: controllerfacebookPath,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Club Categories ',
                                                  style:
                                                      kPrimary_heading.copyWith(
                                                    color: kgrey_primary,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  "Select club Category",
                                                  style: kPrimary_heading_2
                                                      .copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Wrap(
                                                  spacing: 4.0,
                                                  children:
                                                      List<Widget>.generate(
                                                    categories.length,
                                                    (int index) {
                                                      return ChoiceChip(
                                                        selectedColor:
                                                            kRed_primary,
                                                        onSelected: (selected) {
                                                          setState(
                                                            () {
                                                              value = index;
                                                              print(value);
                                                            },
                                                          );
                                                        },
                                                        label: Text(
                                                          categories[index]
                                                              .categoryTitle,
                                                        ),
                                                        labelStyle: TextStyle(
                                                          color: value == index
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                        avatar:
                                                            SvgPicture.asset(
                                                          categories[index]
                                                              .categotyIconPath,
                                                          color: value == index
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                        selected:
                                                            value == index,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: kShadow_activityCard,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  height:
                                      MediaQuery.of(context).size.height * 0.69,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _buildPageIndicator(),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Update club ",
                                      style: kPrimary_heading_2.copyWith(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    SvgPicture.asset(
                                      "images/icons/club.svg",
                                      color: Colors.white,
                                      height: 45,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 15),
                                        child: Row(
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              "images/icons/painter-palette.svg",
                                              color: kgrey_primary,
                                              fit: BoxFit.cover,
                                              height: 30,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Chose Theme',
                                              style: kPrimary_heading.copyWith(
                                                color: kgrey_primary,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.80,
                                        height: 50,
                                        color: Color(0xffCDCBC9),
                                        child: ListView.builder(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                          ),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: ClubColors.length,
                                          itemBuilder: (context, index) {
                                            return ColorBox(
                                              isCliked:
                                                  ClubColors[index].clicked,
                                              colorHex:
                                                  ClubColors[index].colorInt,
                                              onTap: () {
                                                setState(
                                                  () {
                                                    widget.colorHexa =
                                                        ClubColors[index]
                                                            .colorInt;
                                                    if (ClubColors[index]
                                                            .clicked ==
                                                        true) {
                                                      ClubColors[index]
                                                          .clicked = false;
                                                      widget.colorHexa =
                                                          0xff464154;
                                                    } else {
                                                      ClubColors[index]
                                                          .clicked = true;
                                                    }

                                                    for (var i = 0;
                                                        i < ClubColors.length;
                                                        i++) {
                                                      if (ClubColors[index] ==
                                                          ClubColors[i])
                                                        continue;
                                                      ClubColors[i].clicked =
                                                          false;
                                                    }

                                                    print(widget.colorHexa);
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Club Logo",
                                                style:
                                                    kPrimary_heading.copyWith(
                                                  color: kgrey_primary,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          GestureDetector(
                                            onTap: _getImage,
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.20,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35,
                                              child: widget._image != null
                                                  ? Image.file(
                                                      widget._image,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.add,
                                                          size: 40,
                                                        ),
                                                        Text(
                                                          'Upload Club Logo',
                                                          style:
                                                              kPrimary_heading
                                                                  .copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Spacer(
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: kShadow_activityCard,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  height:
                                      MediaQuery.of(context).size.height * 0.69,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _buildPageIndicator(),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: 10,
                                              top: 2,
                                              bottom: 2,
                                              right: 10,
                                            ),
                                            height: 30,
                                            width: 110,
                                            child: Text(
                                              "Preview",
                                              style: kPrimary_heading.copyWith(
                                                color: Color(0xff535252),
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFCDCBC9),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25),
                                                topRight: Radius.circular(25),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Container(
                                          child: Stack(
                                            // overflow: Overflow.clip,
                                            children: <Widget>[
                                              SvgPicture.asset(
                                                'images/phone_frame.svg',
                                                height: 400,
                                              ),
                                              Positioned(
                                                left: 7,
                                                top: 4,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25.0),
                                                    topRight:
                                                        Radius.circular(25.0),
                                                  ),
                                                  child: widget._image == null
                                                      ? Container(
                                                          height: 180,
                                                          width: 185,
                                                          child:
                                                              SvgPicture.asset(
                                                            'images/logos/logo-soical.svg',
                                                          ),
                                                        )
                                                      : Container(
                                                          height: 180,
                                                          width: 185,
                                                          child: Image.file(
                                                            widget._image,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 135,
                                                left: 10,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 14,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Color(widget.colorHexa),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(60),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Club",
                                                    style: kPrimary_heading
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 7,
                                                top: 160,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 5,
                                                    vertical: 15,
                                                  ),
                                                  width: 185,
                                                  height: 230,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(25.0),
                                                      topRight:
                                                          Radius.circular(25.0),
                                                      bottomLeft:
                                                          Radius.circular(21.0),
                                                      bottomRight:
                                                          Radius.circular(21.0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(widget
                                                                .colorHexa),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                4,
                                                              ),
                                                            ),
                                                          ),
                                                          height: 35,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: kShadow_activityCard,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  height:
                                      MediaQuery.of(context).size.height * 0.69,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _buildPageIndicator(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 65.0,
              width: double.infinity,
              color: Color(widget.colorHexa),
              child: GestureDetector(
                onTap: () {
                  Provider.of<ClubData>(context, listen: false).updateClub(
                    Club(
                      clubName: controllerclubName.text,
                      clubDescription: controllerclubDescriparion.text,
                      clubPhone: controllerphoneNumber.text,
                      facebookPath: controllerfacebookPath.text,
                      categoryClub: categories[value].categoryTitle,
                      uid: Provider.of<User>(context, listen: false).uid,
                      colorHexa: widget.colorHexa,
                      imagesPath: this.widget.url == null
                          ? "https://i.imgur.com/reeUKtZ.jpg"
                          : this.widget.url,
                    ),
                    widget.club,
                    widget.club.clubId,
                  );
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Confirm",
                      style: kPrimary_heading_2.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SvgPicture.asset(
                      "images/icons/club.svg",
                      color: Colors.white,
                      height: 45,
                    )
                  ],
                ),
              ),
            )
          : Text(''),
    );
  }
}

class ColorBox extends StatelessWidget {
  final bool isCliked;
  final int colorHex;
  final Function onTap;
  ColorBox({this.colorHex, this.onTap, this.isCliked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          top: 5,
          left: 10,
          bottom: 5,
        ),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: isCliked ? Color(0xffeae7d9) : Colors.transparent,
          ),
          color: Color(colorHex),
        ),
      ),
    );
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
