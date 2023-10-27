class CoursesModel {
  Result? result;
  Null targetUrl;
  bool? success;
  Null error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  CoursesModel(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['targetUrl'] = this.targetUrl;
    data['success'] = this.success;
    data['error'] = this.error;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}

class Result {
  int? totalCount;
  List<CoursesList>? items;

  Result({this.totalCount, this.items});

  Result.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = <CoursesList>[];
      json['items'].forEach((v) {
        items!.add(new CoursesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CoursesList {
  String? imageUrl;
  double? fee;
  String? creationTime;
  int? creatorUserId;
  String? createdBy;
  bool? hasDiscount;
  int? discountPercentage;
  int? trainerId;
  Trainer? trainer;
  int? categoryId;
  Category? category;
  int? trainingHoursCount;
  int? viewsCount;
  String? arDescription;
  String? enDescription;
  String? description;
  int? bookingRequestsCount;
  int? traineesCount;
  List<TraineesProgress>? traineesProgress;
  bool? isFinished;
  double? rate;
  bool? isActive;
  String? arName;
  String? enName;
  String? name;
  int? id;

  CoursesList(
      {this.imageUrl,
      this.fee,
      this.creationTime,
      this.creatorUserId,
      this.createdBy,
      this.hasDiscount,
      this.discountPercentage,
      this.trainerId,
      this.trainer,
      this.categoryId,
      this.category,
      this.trainingHoursCount,
      this.viewsCount,
      this.arDescription,
      this.enDescription,
      this.description,
      this.bookingRequestsCount,
      this.traineesCount,
      this.traineesProgress,
      this.isFinished,
      this.rate,
      this.isActive,
      this.arName,
      this.enName,
      this.name,
      this.id});

  CoursesList.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    fee = json['fee'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'];
    createdBy = json['createdBy'];
    hasDiscount = json['hasDiscount'];
    discountPercentage = json['discountPercentage'];
    trainerId = json['trainerId'];
    trainer =
        json['trainer'] != null ? new Trainer.fromJson(json['trainer']) : null;
    categoryId = json['categoryId'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    trainingHoursCount = json['trainingHoursCount'];
    viewsCount = json['viewsCount'];
    arDescription = json['arDescription'];
    enDescription = json['enDescription'];
    description = json['description'];
    bookingRequestsCount = json['bookingRequestsCount'];
    traineesCount = json['traineesCount'];
    if (json['traineesProgress'] != null) {
      traineesProgress = <TraineesProgress>[];
      json['traineesProgress'].forEach((v) {
        traineesProgress!.add(new TraineesProgress.fromJson(v));
      });
    }
    isFinished = json['isFinished'];
    rate = json['rate'];
    isActive = json['isActive'];
    arName = json['arName'];
    enName = json['enName'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['fee'] = this.fee;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['createdBy'] = this.createdBy;
    data['hasDiscount'] = this.hasDiscount;
    data['discountPercentage'] = this.discountPercentage;
    data['trainerId'] = this.trainerId;
    if (this.trainer != null) {
      data['trainer'] = this.trainer!.toJson();
    }
    data['categoryId'] = this.categoryId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['trainingHoursCount'] = this.trainingHoursCount;
    data['viewsCount'] = this.viewsCount;
    data['arDescription'] = this.arDescription;
    data['enDescription'] = this.enDescription;
    data['description'] = this.description;
    data['bookingRequestsCount'] = this.bookingRequestsCount;
    data['traineesCount'] = this.traineesCount;
    if (this.traineesProgress != null) {
      data['traineesProgress'] =
          this.traineesProgress!.map((v) => v.toJson()).toList();
    }
    data['isFinished'] = this.isFinished;
    data['rate'] = this.rate;
    data['isActive'] = this.isActive;
    data['arName'] = this.arName;
    data['enName'] = this.enName;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Trainer {
  String? imageUrl;
  int? value;
  String? text;

  Trainer({this.imageUrl, this.value, this.text});

  Trainer.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}

class Category {
  int? value;
  String? text;

  Category({this.value, this.text});

  Category.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}

class TraineesProgress {
  int? courseId;
  int? traineeId;
  Null traineeName;
  Null traineeImage;
  int? completedHoursCount;
  Null traineeLength;
  Null traineeWeight;
  Null traineeBMI;

  TraineesProgress(
      {this.courseId,
      this.traineeId,
      this.traineeName,
      this.traineeImage,
      this.completedHoursCount,
      this.traineeLength,
      this.traineeWeight,
      this.traineeBMI});

  TraineesProgress.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    traineeId = json['traineeId'];
    traineeName = json['traineeName'];
    traineeImage = json['traineeImage'];
    completedHoursCount = json['completedHoursCount'];
    traineeLength = json['traineeLength'];
    traineeWeight = json['traineeWeight'];
    traineeBMI = json['traineeBMI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['traineeId'] = this.traineeId;
    data['traineeName'] = this.traineeName;
    data['traineeImage'] = this.traineeImage;
    data['completedHoursCount'] = this.completedHoursCount;
    data['traineeLength'] = this.traineeLength;
    data['traineeWeight'] = this.traineeWeight;
    data['traineeBMI'] = this.traineeBMI;
    return data;
  }
}
