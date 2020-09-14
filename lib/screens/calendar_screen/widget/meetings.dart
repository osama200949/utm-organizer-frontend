import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/calendar_model/meeting_info.dart';
import 'package:utm_orgnization/models/provider/meeting_data.dart';
import 'package:utm_orgnization/utils/constants.dart';

class Meetings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MeetingData>(
      // selector: (_,meetingData ) =>meetingData.getEventToBeShown() ,
      builder: (_, meetingData, ___) {
        // final meetingData = Provider.of<MeetingData>(context);
        return ListView.builder(
          padding: EdgeInsets.only(left: 15),
          scrollDirection: Axis.horizontal,
          itemCount: meetingData.currendDayInfoLength(),
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              meetingData.setCurrentEvent = index;
              Navigator.pushNamed(
                context,
                '/calender_detail',
              );
            },
            child: Card(
              child: Container(
                width: 180,
                height: 150,
                color: meetingData.infoAtIndex(index).backgroundColor,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            // '',
                            meetingData.infoAtIndex(index).meetingTitle,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${meetingData.infoAtIndex(index).dateClass.from} - ${meetingData.infoAtIndex(index).dateClass.to}',
                            // '',
                            style: kPrimary_heading.copyWith(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // Container(
                          //   width: 100,
                          //   child: Stack(
                          //     children: <Widget>[
                          //       CircleAvatar(
                          //         backgroundColor: Color(0xff29A69C),
                          //         maxRadius: 10,
                          //       ),
                          //       SizedBox(
                          //         width: 5,
                          //       ),
                          //       Positioned(
                          //         left: 10,
                          //         child: CircleAvatar(
                          //           backgroundColor: Color(0xffF6A100),
                          //           maxRadius: 10,
                          //         ),
                          //       ),
                          //       Positioned(
                          //         left: 20,
                          //         child: CircleAvatar(
                          //           backgroundColor: Color(0xffB5332B),
                          //           maxRadius: 10,
                          //         ),
                          //       ),
                          //       Positioned(
                          //         left: 30,
                          //         child: CircleAvatar(
                          //           backgroundColor: Color(0xffF57B51),
                          //           child: Text(
                          //             '+3',
                          //             style: TextStyle(
                          //                 fontSize: 10, color: Colors.white),
                          //           ),
                          //           maxRadius: 10,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          color: meetingData.infoAtIndex(index).lableColor,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(30)),
                        ),
                        child: Center(
                          child: Text(
                            // '',
                            meetingData.infoAtIndex(index).labelCategory,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
