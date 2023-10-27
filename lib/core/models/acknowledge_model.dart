
import '../entities/acknowledge_entity.dart';
import 'base_model.dart';

class AcknowledgeModel extends BaseModel<AcknowledgeEntity> {
  AcknowledgeModel();

  factory AcknowledgeModel.fromJson(Map<String, dynamic> json) =>
      AcknowledgeModel();

  Map<String, dynamic> toJson() => {};

  @override
  AcknowledgeEntity toEntity() {
    return AcknowledgeEntity();
  }
}
