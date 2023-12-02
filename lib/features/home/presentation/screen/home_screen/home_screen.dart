import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/ui/error_ui/toast.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/functions.dart';
import '../../../../../core/params/no_params.dart';
import '../../../../../core/ui/widgets/system/double_tap_back_exit_app.dart';
import '../../../../coach/data/model/request/get_coaches_request.dart';
import '../../../../coach/presentation/screen/coach_profile_screen.dart';
import '../../../../coach/presentation/state_m/cubit/coach_cubit.dart';
import '../../../../profile/presentation/state_m/cubit/profile_cubit.dart';
import '../../../../restaurant/data/model/request/get_restaurants_request.dart';
import '../../../../restaurant/presentation/screen/restaurant_details.dart';
import '../../../../restaurant/presentation/state_m/cubit/restaurant_cubit.dart';
import '../../../../shop/data/model/request/get_shops_request.dart';
import '../../../../shop/presentation/screen/shop_details.dart';
import '../../../../shop/presentation/state_m/cubit/shop_cubit.dart';
import '../../state_m/provider/home_screen_notifier.dart';
import 'home_screen_content.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final sn = HomeScreenNotifier();

  @override
  void initState() {
    super.initState();
    AgoraFunctions.handleNavigatingToAgora();
    BlocProvider.of<ProfileCubit>(context).getProfile();
    BlocProvider.of<ProfileCubit>(context).getTrainers();
    _apiRequest();
  }

  Future<void> _apiRequest() async {
    sn.categoryCubit.getCategories(NoParams());
    sn.coachCubit.getCoaches(GetCoachesRequest());
    sn.shopCubit.getShops(GetShopsRequest());
    sn.restaurantCubit.getRestaurants(GetRestaurantsRequest());
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenNotifier>.value(
      value: sn,
      child: DoubleTapBackExitApp(
        child: MultiBlocListener(
            listeners: [
              BlocListener<ShopCubit, ShopState>(
                bloc: sn.shopLocationCubit,
                listener: (context, state) {
                  state.whenOrNull(
                    getShopsState: (shopsEntity) {
                      setState(() {
                        shopsEntity.items?.forEach((element) {
                          if (element.longitude != null &&
                              element.latitude != null) {
                            sn.markers.add(
                              CustomMarker(
                                type: MarkerType.shop,
                                marker: Marker(
                                  markerId: MarkerId(
                                    element.id.toString(),
                                  ),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return ShopDetails(shopsEntity: element);
                                    }));
                                  },
                                  position: LatLng(
                                      element.latitude!, element.longitude!),
                                  icon: sn.customGreenMarker,
                                  infoWindow: InfoWindow(title: element.name),
                                ),
                              ),
                            );
                          }
                        });
                      });
                    },
                    shopErrorState: (error, callback) {},
                  );
                },
              ),
              BlocListener<RestaurantCubit, RestaurantState>(
                bloc: sn.restaurantLocationCubit,
                listener: (context, state) {
                  state.whenOrNull(
                    getRestaurantsState: (restaurantsEntity) {
                      setState(() {
                        restaurantsEntity.items?.forEach((element) {
                          if (element.longitude != null &&
                              element.latitude != null) {
                            sn.markers.add(
                              CustomMarker(
                                type: MarkerType.restaurant,
                                marker: Marker(
                                  markerId: MarkerId(
                                    element.id.toString(),
                                  ),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return PlayingSliverState(
                                          restaurantEntity: element);
                                    }));
                                  },
                                  position: LatLng(
                                      element.latitude!, element.longitude!),
                                  icon: sn.customBlueMarker,
                                  infoWindow: InfoWindow(title: element.name),
                                ),
                              ),
                            );
                          }
                        });
                      });
                    },
                  );
                },
              ),
              BlocListener<CoachCubit, CoachState>(
                bloc: sn.coachLocationCubit,
                listener: (context, state) {
                  state.whenOrNull(
                    getCoachesState: (coachesEntity) {
                      setState(() {
                        coachesEntity.items?.forEach((element) {
                          if (element.longitude != null &&
                              element.latitude != null) {
                            sn.markers.add(
                              CustomMarker(
                                type: MarkerType.coach,
                                marker: Marker(
                                  markerId: MarkerId(
                                    element.id.toString(),
                                  ),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return CoachProfileScreen(
                                          coachModel: element);
                                    }));
                                  },
                                  position: LatLng(
                                      element.latitude!, element.longitude!),
                                  icon: sn.customYellowMarker,
                                  infoWindow: InfoWindow(title: element.name),
                                ),
                              ),
                            );
                          }
                        });
                      });
                    },
                  );
                },
              ),
            ],
            child: RefreshIndicator(
                onRefresh: _apiRequest, child: HomeScreenContent())),
      ),
    );
  }

  /// Widget

  /// Logic
}
