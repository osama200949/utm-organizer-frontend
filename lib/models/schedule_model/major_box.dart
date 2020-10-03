import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/schedule_provider.dart';

class MajorBox extends StatelessWidget {
  MajorBox(
      {this.boxColor, this.boxText, this.textColor, this.index});
  final boxColor;
  final index;
  final boxText;
  final textColor;
  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(builder: (context, sData, child) {
      return GestureDetector(
        onTap: () {
          sData.setCurrentMajor(index);
        },
        child: Container(
          width: 170,
          height: 45,
          decoration: BoxDecoration(
              color: sData.isMajorPressed(index) 
                  ? Color(0xffD63447)
                  : Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            boxText,
            style: TextStyle(
                color: sData.isMajorPressed(index)
                    ? Colors.white
                    : Colors.black,
                fontSize: 14),
          )),
        ),
      );
    }
    );
  }
}
