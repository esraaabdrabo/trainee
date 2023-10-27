import '../../../../../core/models/base_model.dart';

class PlatesModel  {
  Result? result;
  String? targetUrl;
  bool? success;
  String? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  PlatesModel(
      {this.result,
        this.targetUrl,
        this.success,
        this.error,
        this.unAuthorizedRequest,
        this.bAbp});

  PlatesModel.fromJson(Map<String, dynamic> json) {
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

  @override
  toEntity() {
    [];
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
  String? enComponents;
  String? arComponents;
  String? components;
  int? price;
  int? restaurantId;
  Restaurant? restaurant;
  int? categoryId;
  Restaurant? category;
  String? creationTime;
  List<String>? images;
  double? rate;
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
        this.restaurantId,
        this.restaurant,
        this.categoryId,
        this.category,
        this.creationTime,
        this.images,
        this.rate,
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
    restaurantId = json['restaurantId'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
    categoryId = json['categoryId'];
    category = json['category'] != null
        ? new Restaurant.fromJson(json['category'])
        : null;
    creationTime = json['creationTime'];
    images = json['images'].cast<String>();
    rate = json['rate'];
    isActive = json['isActive'];
    arName = json['arName'];
    enName = json['enName'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enComponents'] = this.enComponents;
    data['arComponents'] = this.arComponents;
    data['components'] = this.components;
    data['price'] = this.price;
    data['restaurantId'] = this.restaurantId;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    data['categoryId'] = this.categoryId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['creationTime'] = this.creationTime;
    data['images'] = this.images;
    data['rate'] = this.rate;
    data['isActive'] = this.isActive;
    data['arName'] = this.arName;
    data['enName'] = this.enName;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Restaurant {
  int? value;
  String? text;

  Restaurant({this.value, this.text});

  Restaurant.fromJson(Map<String, dynamic> json) {
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
