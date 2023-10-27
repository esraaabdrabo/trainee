class ProductsModel {
  Result? result;
  String? targetUrl;
  bool? success;
  String? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  ProductsModel(
      {this.result,
        this.targetUrl,
        this.success,
        this.error,
        this.unAuthorizedRequest,
        this.bAbp});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? enComponents;
  String? arComponents;
  String? components;
  int? price;
  int? shopId;
  Shop? shop;
  int? categoryId;
  Shop? category;
  String? creationTime;
  List<String>? images;
  double? rate;
  int? orderCount;
  RatingDetails? ratingDetails;
  bool? isActive;
  String? arName;
  String? enName;
  String? name;
  int? id;

  Items(
      {this.enComponents,
        this.arComponents,
        this.components,
        this.price,
        this.shopId,
        this.shop,
        this.categoryId,
        this.category,
        this.creationTime,
        this.images,
        this.rate,
        this.orderCount,
        this.ratingDetails,
        this.isActive,
        this.arName,
        this.enName,
        this.name,
        this.id});

  Items.fromJson(Map<String, dynamic> json) {
    enComponents = json['enComponents'];
    arComponents = json['arComponents'];
    components = json['components'];
    price = json['price'];
    shopId = json['shopId'];
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    categoryId = json['categoryId'];
    category =
    json['category'] != null ? Shop.fromJson(json['category']) : null;
    creationTime = json['creationTime'];
    images = json['images'].cast<String>();
    rate = json['rate'];
    orderCount = json['orderCount'];
    ratingDetails = json['ratingDetails'] != null
        ? RatingDetails.fromJson(json['ratingDetails'])
        : null;
    isActive = json['isActive'];
    arName = json['arName'];
    enName = json['enName'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['enComponents'] = this.enComponents;
    data['arComponents'] = this.arComponents;
    data['components'] = this.components;
    data['price'] = this.price;
    data['shopId'] = this.shopId;
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    data['categoryId'] = this.categoryId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['creationTime'] = this.creationTime;
    data['images'] = this.images;
    data['rate'] = this.rate;
    data['orderCount'] = this.orderCount;
    if (this.ratingDetails != null) {
      data['ratingDetails'] = this.ratingDetails!.toJson();
    }
    data['isActive'] = this.isActive;
    data['arName'] = this.arName;
    data['enName'] = this.enName;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Shop {
  int? value;
  String? text;

  Shop({this.value, this.text});

  Shop.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}

class RatingDetails {
  int? i1;
  int? i2;
  int? i3;
  int? i4;
  int? i5;

  RatingDetails({this.i1, this.i2, this.i3, this.i4, this.i5});

  RatingDetails.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['1'] = this.i1;
    data['2'] = this.i2;
    data['3'] = this.i3;
    data['4'] = this.i4;
    data['5'] = this.i5;
    return data;
  }
}
