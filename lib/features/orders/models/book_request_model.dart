
class BookingRequestModel {
  String? number;
  int? traineeId;
  TraineeModel? trainee;
  int? courseId;
  Course? course;
  String? creationTime;
  int? paymentMethod;
  int? status;
  int? transactionId;
  int? paidAmount;
  int? id;

  BookingRequestModel(
      {this.number,
        this.traineeId,
        this.trainee,
        this.courseId,
        this.course,
        this.creationTime,
        this.paymentMethod,
        this.status,
        this.transactionId,
        this.paidAmount,
        this.id});

  BookingRequestModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    traineeId = json['traineeId'];
    trainee =
    json['trainee'] != null ? TraineeModel.fromJson(json['trainee']) : null;
    courseId = json['courseId'];
    course =
    json['course'] != null ? Course.fromJson(json['course']) : null;
    creationTime = json['creationTime'];
    paymentMethod = json['paymentMethod'];
    status = json['status'];
    transactionId = json['transactionId'];
    paidAmount = json['paidAmount'];
    id = json['id'];
  }

}



class Course {
  double? fee;
  String? imageUrl;
  int? trainingHoursCount;
  int? value;
  String? text;

  Course(
      {this.fee,
        this.imageUrl,
        this.trainingHoursCount,
        this.value,
        this.text});

  Course.fromJson(Map<String, dynamic> json) {
    fee = json['fee'];
    imageUrl = json['imageUrl'];
    trainingHoursCount = json['trainingHoursCount'];
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fee'] = fee;
    data['imageUrl'] = imageUrl;
    data['trainingHoursCount'] = trainingHoursCount;
    data['value'] = value;
    data['text'] = text;
    return data;
  }
}
class TraineeModel {
  String? name;
  String? phoneNumber;
  String? imageUrl;
  int? id;

  TraineeModel({this.name, this.phoneNumber, this.imageUrl, this.id});

  TraineeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

}