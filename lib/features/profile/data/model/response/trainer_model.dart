import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/profile_entity.dart';
import '../../../domain/entity/trainer_entity.dart';

class TrainerModel extends BaseModel<TrainerEntity> {
 String? name;
 String? image;
  int? id;

  TrainerModel(
      {this.image,
      this.name,
      this.id});

  TrainerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['imageUrl'];
    name = json['name'];}

  @override
  TrainerEntity toEntity() {
    return TrainerEntity(
   id: id,
      name: name,
      imageUrl: image,
    );
  }
}
