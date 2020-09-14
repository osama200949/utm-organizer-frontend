import 'dart:convert';

class Club {
  final String clubId;
  final String clubName;
  final String clubDescription;
  final String clubPhone;
  final String facebookPath;
  final String imagesPath;
  final String imageType;
  final int colorHexa;
  final String categoryClub;
  final String uid;
  final String imge64;

  Club({
    this.clubId,
    this.clubName,
    this.imge64,
    this.clubDescription,
    this.facebookPath,
    this.imagesPath,
    this.imageType,
    this.clubPhone,
    this.categoryClub,
    this.colorHexa = 0xffF57B51,
    this.uid,
  });

  Club.fromJson(Map<String, dynamic> json)
      : this(
          clubId: json['id'],
          clubName: json['clubName'],
          clubDescription: json['clubDescription'],
          facebookPath: json['facebookPath'],
          imagesPath: json['imagesPath'],
          clubPhone: json['clubPhone'],
          categoryClub: json['categoryClub'],
          colorHexa: json['colorHexa'],
          imge64: json['imge64'],
          imageType: json['imageType'],
          uid: json['uid'],
        );

  Map<String, dynamic> toJson() => {
        'clubName': clubName,
        'clubDescription': clubDescription,
        'imagesPath': imagesPath,
        'clubPhone': clubPhone,
        'categoryClub': categoryClub,
        'facebookPath': facebookPath,
        'imge64': imge64,
        'imageType': imageType,
        'colorHexa': colorHexa,
        'uid': uid
      };
}
