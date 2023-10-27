class NotificationModel {
  String? id;
  String? creationTime;
  String? message;

  NotificationModel(
      {this.id, this.creationTime, this.message});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creationTime = json['creationTime'];
    message = json['message'];
  }

}
