import 'package:flutter/material.dart';
import 'package:utm_orgnization/models/provider/meeting_provider.dart';

class BackGroundColorList extends StatefulWidget {
  MeetingProvider meetingData;
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
        padding: EdgeInsets.only(left: 20),
        itemCount: widget.meetingData.bgColorsLength,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.meetingData.tempTask.backgroundColor =
                  widget.meetingData.getBgColors(index);
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.only(left: 5),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: widget.meetingData.getBgColors(index),
                child:  widget.meetingData.tempTask.backgroundColor ==
                  widget.meetingData.getBgColors(index)
                    ? Icon(Icons.check)
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
