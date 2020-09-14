// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:utm_orgnization/data/jsonData.dart';
// import 'package:utm_orgnization/models/provider/schedule_data.dart';
// import 'package:utm_orgnization/models/schedule_model/year.dart';
// // import 'package:utm_orgnization/models/schedule_model/semester.dart';

// class Try extends StatefulWidget {
//   @override
//   _TryState createState() => _TryState();
// }

// class _TryState extends State<Try> {
//   Future<List<Year>> _futureData;

//   @override
//   void initState() {
//     super.initState();
//     _futureData = dataService.fetchData();
//     // print(_futureData);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Year>>(
//         future: _futureData,
//         builder: (context, snapshot) {
//           // print(snapshot.data);
//           if (snapshot.hasData) {
//             return _buildScreen(snapshot.data);
//           }
//           return Scaffold(
//             body: Center(child: Text("Error")),
//           );
//         });
//   }

//   Widget _buildScreen(d) {
//     List<Year> data = d;
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Text(
//               "${data[0].semesters[0].courses[0].sections[0].doctor.classes[0].startTime}"),
//         ),
//       ),
//     );
//   }
// }
