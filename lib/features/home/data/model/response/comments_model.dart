
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/comments_entity.dart';

class CommentsModel extends BaseModel<CommentsEntity> {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentsModel({this.postId, this.id, this.name, this.email, this.body});

  CommentsModel.fromJson(dynamic json) {
    postId = json["postId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["postId"] = postId;
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["body"] = body;
    return map;
  }

  @override
  CommentsEntity toEntity() {
    return CommentsEntity(
      body: this.body,
      name: this.name,
      id: this.id,
      email: this.email,
      postId: this.postId,
    );
  }
}
