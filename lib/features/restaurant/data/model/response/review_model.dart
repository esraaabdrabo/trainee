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
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['targetUrl'] = targetUrl;
    data['success'] = success;
    data['error'] = error;
    data['unAuthorizedRequest'] = unAuthorizedRequest;
    data['__abp'] = bAbp;
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
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalCount'] = totalCount;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
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
    reviewer =
        json['reviewer'] != null ? Reviewer.fromJson(json['reviewer']) : null;
    refId = json['refId'];
    refType = json['refType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rate'] = rate;
    data['comment'] = comment;
    data['creationTime'] = creationTime;
    data['isHidden'] = isHidden;
    data['reviewerId'] = reviewerId;
    if (reviewer != null) {
      data['reviewer'] = reviewer!.toJson();
    }
    data['refId'] = refId;
    data['refType'] = refType;
    data['id'] = id;
    return data;
  }
}

class Reviewer {
  String? name;
  String? phoneNumber;
  String? imageUrl;
  int? id;

  Reviewer({this.name, this.phoneNumber, this.imageUrl, this.id});

  Reviewer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    return data;
  }
}
