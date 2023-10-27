class ReviewModel {
  Result? result;
  Null? targetUrl;
  bool? success;
  Null? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  ReviewModel(
      {this.result,
        this.targetUrl,
        this.success,
        this.error,
        this.unAuthorizedRequest,
        this.bAbp});

  ReviewModel.fromJson(Map<String, dynamic> json) {
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
  List<Items>? items;

  Result({this.totalCount, this.items});

  Result.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
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

class Items {
  int? rate;
  String? comment;
  String? creationTime;
  bool? isHidden;
  int? reviewerId;
  Reviewer? reviewer;
  int? refId;
  int? refType;
  int? id;

  Items(
      {this.rate,
        this.comment,
        this.creationTime,
        this.isHidden,
        this.reviewerId,
        this.reviewer,
        this.refId,
        this.refType,
        this.id});

  Items.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    comment = json['comment'];
    creationTime = json['creationTime'];
    isHidden = json['isHidden'];
    reviewerId = json['reviewerId'];
    reviewer = json['reviewer'] != null
        ? new Reviewer.fromJson(json['reviewer'])
        : null;
    refId = json['refId'];
    refType = json['refType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['comment'] = this.comment;
    data['creationTime'] = this.creationTime;
    data['isHidden'] = this.isHidden;
    data['reviewerId'] = this.reviewerId;
    if (this.reviewer != null) {
      data['reviewer'] = this.reviewer!.toJson();
    }
    data['refId'] = this.refId;
    data['refType'] = this.refType;
    data['id'] = this.id;
    return data;
  }
}

class Reviewer {
  String? name;
  String? phoneNumber;
  Null? imageUrl;
  int? id;

  Reviewer({this.name, this.phoneNumber, this.imageUrl, this.id});

  Reviewer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}
