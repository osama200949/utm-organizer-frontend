import 'package:flutter/material.dart';
import 'package:utm_orgnization/models/provider/meeting_data.dart';

class BackGroundColorList extends StatefulWidget {
  MeetingData meetingData;
  BackGroundColorList(this.meetingData);

  @override
  _BackGroundColorListState createState() => _BackGroundColorListState();
}

class _BackGroundColorListState extends State<BackGroundColorList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.builder(
         padding: EdgeInsets.only(left: 10),
        itemCount: widget.meetingData.bgColorsLength
,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.meetingData.setCurrentColor(index);
              setState(() {});
            },
            child: Container(
              width: 65,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.meetingData.getBgColors(index),
                border: Border.all(color: Colors.black),
              ),
              child: widget.meetingData.getHighlightedColor(index)
                  ? Icon(Icons.check)
                  : null,
            ),
          );
        },
      ),
    );
  }
}
