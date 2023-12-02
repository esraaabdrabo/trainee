import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../category/presentation/state_m/cubit/category_cubit.dart';
import '../../../../coach/data/model/request/get_coaches_request.dart';
import '../../../../coach/presentation/state_m/cubit/coach_cubit.dart';
import '../../../../restaurant/data/model/request/get_restaurants_request.dart';
import '../../../../restaurant/presentation/state_m/cubit/restaurant_cubit.dart';
import '../../../../shop/data/model/request/get_shops_request.dart';
import '../../../../shop/presentation/state_m/cubit/shop_cubit.dart';
import '../bloc/home_cubit.dart';
import '../bloc/maps_cubit.dart';

class HomeScreenNotifier extends ScreenNotifier {
  /// Fields

  final HomeCubit homeCubit = HomeCubit();
  final CategoryCubit categoryCubit = CategoryCubit();
  final CoachCubit coachCubit = CoachCubit();
  final CoachCubit coachLocationCubit = CoachCubit();
  final RestaurantCubit restaurantCubit = RestaurantCubit();
  final RestaurantCubit restaurantLocationCubit = RestaurantCubit();
  final ShopCubit shopCubit = ShopCubit();
  final ShopCubit shopLocationCubit = ShopCubit();
  TextEditingController _searchTextController = TextEditingController();
  late Set<CustomMarker> _markers = {};
  late final BitmapDescriptor customRedMarker;
  late final BitmapDescriptor customYellowMarker;
  late final BitmapDescriptor customGreenMarker;
  late final BitmapDescriptor customBlueMarker;
  bool shopsSelected = false;
  bool restaurantsSelected = false;
  bool coachesSelected = false;
  bool gymsSelected = false;

  late BuildContext context;
  bool _isLoading = false;
  LatLng? _latLng;

  HomeScreenNotifier() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(30.h, 30.w)),
            AppConstants.PLACE_MARKER_RED_ICON)
        .then((value) => customRedMarker = value);
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(30.h, 30.w)),
            AppConstants.PLACE_MARKER_YELLOW_ICON)
        .then((value) => customYellowMarker = value);
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(30.h, 30.w)),
            AppConstants.PLACE_MARKER_GREEN_ICON)
        .then((value) => customGreenMarker = value);
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(30.h, 30.w)),
            AppConstants.PLACE_MARKER_BLUE_ICON)
        .then((value) => customBlueMarker = value);
  }

  /// Methods

  void homeLoadingStateListener() {
    _isLoading = true;
    notifyListeners();
  }

  LatLng? get latLng => _latLng;

  set latLng(LatLng? value) {
    _latLng = value;
    notifyListeners();
  }

  @override
  void closeNotifier() {
    homeCubit.close();
    this.dispose();
  }

  TextEditingController get searchTextController => _searchTextController;

  Set<CustomMarker> get markers => _markers;

  set markers(Set<CustomMarker> value) {
    _markers = value;
    notifyListeners();
  }

  Future<void> getShopsLocations() async {
    shopsSelected = !shopsSelected;
    markers.removeWhere((element) => element.type == MarkerType.shop);
    if (shopsSelected) {
      await shopLocationCubit.getShops(GetShopsRequest(
        latitude: latLng?.latitude,
        longitude: latLng?.longitude,
      ));
    } else {
      notifyListeners();
    }
  }

  void getRestaurantsLocations() {
    restaurantsSelected = !restaurantsSelected;
    markers.removeWhere((element) => element.type == MarkerType.restaurant);
    if (restaurantsSelected) {
      restaurantLocationCubit.getRestaurants(GetRestaurantsRequest(
        latitude: latLng?.latitude,
        longitude: latLng?.longitude,
      ));
    } else {
      notifyListeners();
    }
  }

  void getCoachesLocations() {
    coachesSelected = !coachesSelected;
    markers.removeWhere((element) => element.type == MarkerType.coach);
    if (coachesSelected) {
      coachLocationCubit.getCoaches(GetCoachesRequest(
        latitude: latLng?.latitude,
        longitude: latLng?.longitude,
      ));
    } else {
      notifyListeners();
    }
  }

  void getGymsLocations() {}

  /// Getters and Setters

  get isLoading => this._isLoading;
}

class CustomMarker {
  final MarkerType type;
  final Marker marker;

  CustomMarker({required this.type, required this.marker});
}

enum MarkerType { shop, restaurant, coach, gym, myLocation }
