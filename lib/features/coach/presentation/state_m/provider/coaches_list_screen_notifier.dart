import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/common/session_data.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/entities/specialization_entity.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/results/result.dart';
import '../../../../category/domain/entity/category_entity.dart';
import '../../../data/model/request/get_coaches_request.dart';
import '../../../domain/entity/coach_entity.dart';
import '../cubit/coach_cubit.dart';

class CoachesListScreenNotifier extends ScreenNotifier {
  final String NEAREST = 'Nearest';
  final String RATE = 'Rate';

  /// Fields
  late BuildContext context;
  CoachCubit _coachCubit = CoachCubit();
  RefreshController refreshController = RefreshController();
  List<CoachEntity> _coaches = [];
  bool _isHighRate = false;
  bool _isLowRate = false;
  bool _isNearest = false;
  bool _isFarthest = false;
  SpecializationEntity _specializationEntity = SpecializationEntity(text: '');
  bool _isHighRateTemp = false;
  bool _isLowRateTemp = false;
  bool _isNearestTemp = false;
  bool _isFarthestTemp = false;
  SpecializationEntity _specializationEntityTemp =
      SpecializationEntity(text: '');
  TextEditingController searchController = TextEditingController();
  CategoryEntity? categoryEntity;

  /// Getters and Setters
  List<CoachEntity> get coaches => _coaches;

  set coaches(List<CoachEntity> value) {
    _coaches = value;
  }

  bool get isHighRate => _isHighRate;

  set isHighRate(bool value) {
    _isHighRate = value;
    if (value) isLowRate = false;
    notifyListeners();
  }

  bool get isLowRate => _isLowRate;

  set isLowRate(bool value) {
    _isLowRate = value;
    if (value) isHighRate = false;
    notifyListeners();
  }

  bool get isNearest => _isNearest;

  set isNearest(bool value) {
    _isNearest = value;
    if (value) isFarthest = false;
    notifyListeners();
  }

  SpecializationEntity get specializationEntity => _specializationEntity;

  set specializationEntity(SpecializationEntity value) {
    _specializationEntity = value;
  }

  bool get isFarthest => _isFarthest;

  set isFarthest(bool value) {
    _isFarthest = value;
    if (value) isNearest = false;
    notifyListeners();
  }

  CoachCubit get coachCubit => _coachCubit;

  /// Methods
  @override
  void closeNotifier() {
    this.dispose();
  }

  Future<Result<AppErrors, List<CoachEntity>>> returnData(int unit) async {
    return coachCubit.returnCoaches(
      setRequestParams(unit: unit),
    );
  }

  void fetchData(int unit, {String? text}) async {
    coachCubit.getCoaches(setRequestParams(
      unit: unit,
    ));
  }

  GetCoachesRequest setRequestParams({
    required int unit,
  }) {
    String _sorting = '';
    double? lat;
    double? lng;
    if (isNearest || isFarthest) {
      _sorting = _sorting + NEAREST;
      lat = Provider.of<SessionDataProvider>(context, listen: false)
          .myLocation
          ?.latitude;
      lng = Provider.of<SessionDataProvider>(context, listen: false)
          .myLocation
          ?.longitude;
    }

    if (isHighRate || isLowRate){ if (_sorting == '') {
      _sorting = _sorting + RATE;
    } else {
      _sorting = '$_sorting, $RATE';
    }}

    return GetCoachesRequest(
      categoryId: categoryEntity?.id,
      sorting: _sorting,
      specializationId: specializationEntity.value,
      skipCount: unit! * AppConstants.pageLength,
      latitude: lat,
      longitude: lng,
      keyword: searchController.text,
      maxResultCount: AppConstants.pageLength,
    );
  }

  void onDataFetched(List<CoachEntity> items, int nextUnit) {

    _coaches = items;
    notifyListeners();
  }

  bool get isHighRateTemp => _isHighRateTemp;

  set isHighRateTemp(bool value) {
    _isHighRateTemp = value;
    if (value) isLowRateTemp = false;

    notifyListeners();
  }

  void applyFilter() {
    isLowRate = isLowRateTemp;
    isHighRate = isHighRateTemp;
    isNearest = isNearestTemp;
    isFarthest = isFarthestTemp;
    specializationEntity = specializationEntityTemp;
    refreshController.requestRefresh();
    notifyListeners();
  }

  bool get isLowRateTemp => _isLowRateTemp;

  set isLowRateTemp(bool value) {
    _isLowRateTemp = value;
    if (value) isHighRateTemp = false;
    notifyListeners();
  }

  bool get isNearestTemp => _isNearestTemp;

  set isNearestTemp(bool value) {
    _isNearestTemp = value;
    if (value) isFarthestTemp = false;
    notifyListeners();
  }

  bool get isFarthestTemp => _isFarthestTemp;

  set isFarthestTemp(bool value) {
    _isFarthestTemp = value;

    if (value) isNearestTemp = false;
    notifyListeners();
  }

  SpecializationEntity get specializationEntityTemp =>
      _specializationEntityTemp;

  set specializationEntityTemp(SpecializationEntity value) {
    _specializationEntityTemp = value;
  }
}

//todo refactoring
class TempCoachModel {
  late String name;
  late String job;
  late String imagePath;
  late String location;
  late double rate;

  TempCoachModel(
      {required this.name,
      required this.job,
      required this.location,
      required this.rate,
      required this.imagePath});
}
