
import 'message_model.dart';

class ChatModel{
  String? id;
  int? traineeId;
  int? trainerId;
  String? traineeName;
  String? trainerName;
  String? traineeImage;
  String? trainerImage;

  ChatModel(
      {this.id,
      this.traineeId,
      this.trainerId,
      this.traineeName,
      this.trainerName,
      this.traineeImage,
      this.trainerImage,
      });

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    traineeId = json['traineeId'];
    trainerId = json['trainerId'];
    traineeName = json['traineeName'];
    trainerName = json['trainerName'];
    traineeImage = json['traineeImage'];
    trainerImage = json['trainerImage'];

  }
}