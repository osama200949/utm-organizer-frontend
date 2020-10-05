class NotificationModel {
  String id;
  String userID;
  final String title;
  final String body;

  NotificationModel({this.id = '',this.userID, this.body,this.title});

  NotificationModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            userID: json['userID'] ,
            title: json['title'],
            body: json['body']
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userID': userID,
        'title': title,
        'body': body,
      };

}