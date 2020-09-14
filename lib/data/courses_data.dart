// import 'package:utm_orgnization/models/schedule_model/course.dart';
// import 'package:utm_orgnization/models/schedule_model/day.dart';
// import 'package:utm_orgnization/models/schedule_model/doctor.dart';
// import 'package:utm_orgnization/models/schedule_model/section.dart';
// import 'package:utm_orgnization/models/schedule_model/semester.dart';
// import 'package:utm_orgnization/models/schedule_model/time.dart';
// import 'package:utm_orgnization/models/schedule_model/year.dart';

// List<Year> yearData = [
//   Year(
//     number: "First",
//     semesters: [
//       Semester(
//         number: 1,
//         courses: [
//           Course(name: "Digital Logic", code: "SCSR1013", sections: [
//             Section(
//               number: 1,
//               doctor: Doctor(name: "Siti Hajar Binti Othman", days: [
//                 Day(
//                   name: "Tuesday",
//                   time: Time(
//                     startsAt: "08:00",
//                     endsAt: "10:00",
//                   ),
//                 ),
//                 Day(
//                   name: "Wednesday",
//                   time: Time(
//                     startsAt: "12:00",
//                     endsAt: "13:00",
//                   ),
//                 ),
//               ]),
//             ),
//             Section(
//               number: 2,
//               doctor: Doctor(name: "Mohd Murtadha bin Mohamad", days: [
//                 Day(
//                   name: "Monday",
//                   time: Time(
//                     startsAt: "14:00",
//                     endsAt: "16:00",
//                   ),
//                 ),
//                 Day(
//                   name: "Tuesday",
//                   time: Time(
//                     startsAt: "12:00",
//                     endsAt: "13:00",
//                   ),
//                 ),
//               ]),
//             ),
//           ]),
//           Course(name: "Programming Technique 1", code: "SCSJ1013", sections: [
//             Section(
//               number: 3,
//               doctor: Doctor(name: "Haswadi bin Hasan", days: [
//                 Day(
//                   name: "Monday",
//                   time: Time(
//                     startsAt: "11:00",
//                     endsAt: "13:00",
//                   ),
//                 ),
//                 Day(
//                   name: "Thursday",
//                   time: Time(
//                     startsAt: "10:00",
//                     endsAt: "12:00",
//                   ),
//                 ),
//               ]),
//             ),
//             Section(
//               number: 4,
//               doctor: Doctor(name: "Johan bin Mohamad Sharif", days: [
//                 Day(
//                   name: "Sunday",
//                   time: Time(
//                     startsAt: "11:00",
//                     endsAt: "13:00",
//                   ),
//                 ),
//                 Day(
//                   name: "Monday",
//                   time: Time(
//                     startsAt: "11:00",
//                     endsAt: "13:00",
//                   ),
//                 ),
//               ]),
//             )
//           ]),
//         ],
//       ),
//       Semester(
//         number: 2,
//         courses: [
//           Course(
//             code: "SCSR1033",
//             name: "Computer Organization and Architecture",
//             sections: [
//               Section(
//                 number: 1,
//                 doctor: Doctor(
//                   name: "Ahmad Fariz bin Ali",
//                   days: [
//                     Day(
//                       name: "Tuesday",
//                       time: Time(
//                         startsAt: "11:00",
//                         endsAt: "13:00",
//                       ),
//                     ),
//                     Day(
//                       name: "Thursday",
//                       time: Time(
//                         startsAt: "08:00",
//                         endsAt: "09:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Section(
//                 number: 2,
//                 doctor: Doctor(
//                   name: "Zuriahati binti Mohd Yunos",
//                   days: [
//                     Day(
//                       name: "Monday",
//                       time: Time(
//                         startsAt: "08:00",
//                         endsAt: "10:00",
//                       ),
//                     ),
//                     Day(
//                       name: "Tuesday",
//                       time: Time(
//                         startsAt: "12:00",
//                         endsAt: "13:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Course(
//             code: "SCSJ1023",
//             name: "Programming Technique II",
//             sections: [
//               Section(
//                 number: 2,
//                 doctor: Doctor(
//                   name: "Mohamad Ashari bin Hj. Alias",
//                   days: [
//                     Day(
//                       name: "Sunday",
//                       time: Time(
//                         startsAt: "08:00",
//                         endsAt: "10:00",
//                       ),
//                     ),
//                     Day(
//                       name: "Monday",
//                       time: Time(
//                         startsAt: "11:00",
//                         endsAt: "13:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Section(
//                 number: 3,
//                 doctor: Doctor(
//                   name: "Lizawati binti Mi Yusof",
//                   days: [
//                     Day(
//                       name: "Sunday",
//                       time: Time(
//                         startsAt: "08:00",
//                         endsAt: "10:00",
//                       ),
//                     ),
//                     Day(
//                       name: "Monday",
//                       time: Time(
//                         startsAt: "08:00",
//                         endsAt: "10:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//   ),
//   Year(
//     number: "Second",
//     semesters: [
//       Semester(
//         number: 3,
//         courses: [
//           Course(
//             name: "Network Communications",
//             code: "SCSR1213",
//             sections: [
//               Section(
//                 number: 1,
//                 doctor: Doctor(
//                   name: "Mohd Fo'ad bin Rohani",
//                   days: [
//                     Day(
//                       name: "Tuesday",
//                       time: Time(
//                         startsAt: "11:00",
//                         endsAt: "13:00",
//                       ),
//                     ),
//                     Day(
//                       name: "Wednesday",
//                       time: Time(
//                         startsAt: "11:00",
//                         endsAt: "12:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Section(
//                 number: 2,
//                 doctor: Doctor(
//                   name: "Mohd Murtadha bin Mohamad",
//                   days: [
//                     Day(
//                       name: "Monday",
//                       time: Time(
//                         startsAt: "14:00",
//                         endsAt: "16:00",
//                       ),
//                     ),
//                     Day(
//                       name: "Tuesday",
//                       time: Time(
//                         startsAt: "12:00",
//                         endsAt: "13:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       Semester(
//         number: 4,
//         courses: [
//           Course(
//             name: "Software Engineering",
//             code: "SCSJ2203",
//             sections: [
//               Section(
//                 number: 1,
//                 doctor: Doctor(
//                   name: "Adila Firdaus binti Arbain",
//                   days: [
//                     Day(
//                       name: "Monday",
//                       time: Time(
//                         startsAt: "14:00",
//                         endsAt: "17:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Section(
//                 number: 2,
//                 doctor: Doctor(
//                   name: "Shahida binti Sulaiman",
//                   days: [
//                     Day(
//                       name: "Monday",
//                       time: Time(
//                         startsAt: "14:00",
//                         endsAt: "17:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Course(
//             name: "Requirements Engineering",
//             code: "SCSJ2253",
//             sections: [
//               Section(
//                 number: 1,
//                 doctor: Doctor(
//                   name: "Shahliza binti Abd. Halim",
//                   days: [
//                     Day(
//                       name: "Sunday",
//                       time: Time(
//                         startsAt: "10:00",
//                         endsAt: "13:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Section(
//                 number: 2,
//                 doctor: Doctor(
//                   name: "Noraini binti Ibrahim",
//                   days: [
//                     Day(
//                       name: "Sunday",
//                       time: Time(
//                         startsAt: "10:00",
//                         endsAt: "13:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//   ),
//   Year(
//     number: "Third",
//     semesters: [
//       Semester(
//         number: 5,
//         courses: [
//           Course(
//             name: "Application Development",
//             code: "SCSJ3104",
//             sections: [
//               Section(
//                 number: 1,
//                 doctor: Doctor(
//                   name: "Ahmad Fadhil Bin Yusof",
//                   days: [
//                     Day(
//                       name: "Sunday",
//                       time: Time(
//                         startsAt: "14:00",
//                         endsAt: "16:00",
//                       ),
//                     ),
//                     Day(
//                       name: "Tuesday",
//                       time: Time(
//                         startsAt: "08:00",
//                         endsAt: "10:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       Semester(
//         number: 6,
//         courses: [
//           Course(
//             name: "Mobile Application Programming",
//             code: "SCSJ3623",
//             sections: [
//               Section(
//                 number: 4,
//                 doctor: Doctor(
//                   name: "Jumail Bin Taliba",
//                   days: [
//                     Day(
//                       name: "Monday",
//                       time: Time(
//                           startsAt: "14:00",
//                           endsAt: "17:00"), //["14:00 - 17:00"],
//                     ),
//                   ],
//                 ),
//               ),
//               Section(
//                 number: 5,
//                 doctor: Doctor(
//                   name: "Jumail Bin Taliba",
//                   days: [
//                     Day(
//                         name: "Wednesday",
//                         time: Time(startsAt: "14:00", endsAt: "17:00")),
//                   ],
//                 ),
//               ),
//               Section(
//                 number: 6,
//                 doctor: Doctor(
//                   name: "Jumail Bin Taliba",
//                   days: [
//                     Day(
//                         name: "Thursday",
//                         time: Time(startsAt: "10:00", endsAt: "13:00")),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Course(
//             name: "Software Quality Assurance",
//             code: "SCSJ3343",
//             sections: [
//               Section(
//                 number: 2,
//                 doctor: Doctor(
//                   name: "Wan Moh Nasir",
//                   days: [
//                     Day(
//                         name: "Tuesday",
//                         time: Time(
//                           startsAt: "10:00",
//                           endsAt: "13:00",
//                         )
//                         //["10:00 - 13:00"],
//                         ),
//                   ],
//                 ),
//               ),
//               Section(
//                 number: 3,
//                 doctor: Doctor(
//                   name: "Radziah binti Mohamad",
//                   days: [
//                     Day(
//                         name: "Tuesday",
//                         time: Time(startsAt: "10:00", endsAt: "13:00")),
//                   ],
//                 ),
//               ),
//               Section(
//                 number: 4,
//                 doctor: Doctor(
//                   name: "Rohayanti Binti Hassan",
//                   days: [
//                     Day(
//                         name: "Wednesday",
//                         time: Time(startsAt: "10:00", endsAt: "13:00")),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       )
//     ],
//   ),
//   Year(
//     number: "Fourth",
//     semesters: [
//       Semester(
//         number: 7,
//         courses: [
//           Course(
//             name: "Industrial Training (HW)",
//             code: "SCSJ4118",
//             sections: [
//               Section(number: 1, doctor: null),
//             ],
//           ),
//           Course(
//             name: "Industrial Training Report",
//             code: "SCSJ4114",
//             sections: [
//               Section(number: 1, doctor: null),
//             ],
//           ),
//         ],
//       ),
//       Semester(
//         number: 8,
//         courses: [
//           Course(
//             name: "Introduction to Entrepreneurship",
//             code: "UHAK1032",
//             sections: [
//               Section(
//                 number: 1,
//                 doctor: Doctor(
//                   name: "Hairudin bin Abd Majid",
//                   days: [
//                     Day(
//                       name: "Tuesday",
//                       time: Time(
//                         startsAt: "10:00",
//                         endsAt: "13:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Course(
//             name: "Real-Time Software Engineering",
//             code: "SCSJ4423",
//             sections: [
//               Section(
//                 number: 1,
//                 doctor: Doctor(
//                   name: "Dayang Norhayati bt. Abang Jawawi",
//                   days: [
//                     Day(
//                       name: "Wednesday",
//                       time: Time(
//                         startsAt: "10:00",
//                         endsAt: "13:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Section(
//                 number: 2,
//                 doctor: Doctor(
//                   name: "Nor Azizah binti Sa'adon",
//                   days: [
//                     Day(
//                       name: "Wednesday",
//                       time: Time(
//                         startsAt: "10:00",
//                         endsAt: "13:00",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//   ),
// ];
