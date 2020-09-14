import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/meeting_data.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MeetingData>(
      builder: (context, meetingData, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            height: 42,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10),
              itemCount: meetingData.categoriesLength,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                  ),
                  // child: ChoiceChip(
                  //   backgroundColor: Color(0xffF9F6F7),
                  //   label: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //     child: Text("${meetingData.getCategory(index)}"),
                  //   ),

                  //   selectedColor: Color(0xffD63447),
                  //   selected: meetingData.currentCategory  == index,

                  //   labelStyle: TextStyle(
                  //       fontSize: 15,
                  //       color: meetingData.currentCategory == index ? Colors.white : Colors.black),
                  //   onSelected: (isSelected) {
                  //     meetingData.setCurrentCategory(index);
                  //     meetingData.tempTask.labelCategory = meetingData.getCategory(index);
                  //   },
                  // ),
                  child: GestureDetector(
                    onTap: () {
                      // meetingData.tempTask.labelCategory = meetingData.getCategory(index).categoryText;
                      meetingData.currentCategory = index;
                      meetingData.tempTask.labelCategory =
                          meetingData.getCategory(index);
                      setState(() {});
                    },
                    child: Container(
                      width: 80,
                      height: 10,
                      decoration: BoxDecoration(
                        color: meetingData.getBoxColor(index),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          meetingData.getCategory(index),
                          style: TextStyle(
                            fontSize: 14,
                            color: meetingData.getTextColor(index),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
