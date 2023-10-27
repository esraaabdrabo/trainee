import '../models/base_model.dart';

class ModelsFactory {
  // Singleton handling.
  static ModelsFactory? _instance;

  static ModelsFactory getInstance() {
    if (_instance != null) return _instance!;
    _instance = ModelsFactory();
    return _instance!;
  }

  // Mapping each model name with the actual value using fromJson factory method.
  Map<String, dynamic Function(Map<String, dynamic>)> _modelsMap = {};

  // Register the model in the map.
  void registerModel(
      String modelName,
      dynamic Function(Map<String, dynamic>) modelCreator,
      ) {
    _modelsMap.putIfAbsent(modelName, () => modelCreator);
  }

  // Generate the desired T model.
  T createModel<T extends BaseModel>(json) {
    final modelName = T.toString();
//    assert(_modelsMap.containsKey(modelName));
    final model = _modelsMap[modelName]!(json) as T;
    return model;
  }

  // Generate list of T model.
  List<T?> createModelsList<T extends BaseModel>(json) {
    return (json as List)
        .map((m) => m == null ? null : createModel<T>(m))
        .toList();
  }
}
