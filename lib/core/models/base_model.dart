import '../entities/base_entity.dart';

abstract class BaseModel<T extends BaseEntity>{
  T toEntity();
}

abstract class Basel<T>{
}