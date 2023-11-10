import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:upgrade_traine_project/features/coach/domain/entity/coach_entity.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/session_data.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/utils.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/datasources/shared_preference.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../../../core/ui/widgets/blur_widget.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../../core/ui/widgets/custom_text.dart';
import '../../../../../core/ui/widgets/google_map_widget.dart';
import '../../../../../core/ui/widgets/image_with_title_widget.dart';
import '../../../../../core/ui/widgets/title_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../category/domain/entity/category_entity.dart';
import '../../../../category/presentation/screen/category_list_screen.dart';
import '../../../../category/presentation/state_m/cubit/category_cubit.dart';
import '../../../../coach/presentation/screen/coach_profile_screen.dart';
import '../../../../coach/presentation/screen/coaches_list_screen.dart';
import '../../../../coach/presentation/state_m/cubit/coach_cubit.dart';
import '../../../../restaurant/presentation/screen/restaurant_details.dart';
import '../../../../restaurant/presentation/screen/restaurant_view.dart';
import '../../../../restaurant/presentation/state_m/cubit/restaurant_cubit.dart';
import '../../../../shop/presentation/screen/shop_details.dart';
import '../../../../shop/presentation/screen/shops_view.dart';
import '../../../../shop/presentation/state_m/cubit/shop_cubit.dart';
import '../../../data/model/request/place_suggestation.dart';
import '../../state_m/bloc/maps_cubit.dart';
import '../../state_m/provider/home_screen_notifier.dart';
import '../../widget/place_item.dart';

class HomeScreenContent extends StatefulWidget {
  HomeScreenContent({Key? key}) : super(key: key);

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  late HomeScreenNotifier sn;
  List<PlaceSuggestation> places = [];
  late PlaceSuggestation placeSuggestion;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<HomeScreenNotifier>(context);
    sn.context = context;
    return _buildHomeScreen(context);
  }

  Widget buildSuggestionsBloc() {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is MapsPlacesLoaded) {
          places = (state).places;
          if (places.isNotEmpty) {
            return buildPlacesList();
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }

  void getSelectedPlaceLocation() {
    final sessionToken = Uuid().v4();
    BlocProvider.of<MapsCubit>(context)
        .emitPlaceLocation(placeSuggestion.placeId, sessionToken);
  }

  LatLng? newLatLng;

  Widget buildPlacesList() {
    return BlocConsumer<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlaceLocationLoaded) {
          _getNewLocation(locationData: state.place.result.geometry.location);
          newLatLng = LatLng(state.place.result.geometry.location.lat,
              state.place.result.geometry.location.lng);
          setState(() {});
        }
      },
      builder: (context, state) {
        return Container(
          color: Colors.black,
          padding: EdgeInsets.all(5.h),
          child: ListView.builder(
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    placeSuggestion = places[index];
                    getSelectedPlaceLocation();
                  },
                  child: PlaceItem(
                    index: index,
                    suggestion: places[index],
                  ),
                );
              },
              itemCount: places.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics()),
        );
      },
    );
  }

  Widget _buildHomeScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: HomeAppbar(controller: sn.searchTextController),
      body: Stack(
        children: [
          _buildHomeScreenBody(context),
          buildSuggestionsBloc(),
        ],
      ),
    );
  }

  Widget _buildMapPinSearchWidget(
      {required Color color,
      required String iconPath,
      required String text,
      required Function onPressed,
      required bool selected}) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ImageIcon(
                AssetImage(
                  iconPath,
                ),
                color: AppColors.white,
                size: 20.w,
              ),
            ),
          ),
          Gaps.vGap4,
          CustomText(
            text: text,
            fontSize: AppConstants.textSize12,
            fontWeight: FontWeight.bold,
            color: selected ? AppColors.accentColorLight : AppColors.white,
          )
        ],
      ),
    );
  }

  Widget _buildSectionWidget(
      {required String title,
      required Function onSeeAllTapped,
      required List<TempWidget> widgets,
      required Function(int index) onItemSelected}) {
    return Column(
      children: [
        TitleWidget(
          title: title,
          subtitleColorTapped: onSeeAllTapped,
          subtitle: Translation.of(context).see_all,
        ),
        Gaps.vGap14,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widgets.isNotEmpty
                        ? Expanded(
                            child: GestureDetector(
                            onTap: () {
                              onItemSelected(0);
                            },
                            child: ImageWithTitleWidget(
                                title: widgets.elementAt(0).title,
                                imgPath: widgets.elementAt(0).imgPath,
                                description: widgets.elementAt(0).description),
                          ))
                        : const SizedBox.shrink(),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          widgets.length > 1
                              ? Expanded(
                                  child: GestureDetector(
                                  onTap: () {
                                    onItemSelected(1);
                                  },
                                  child: ImageWithTitleWidget(
                                      title: widgets.elementAt(1).title,
                                      imgPath: widgets.elementAt(1).imgPath,
                                      description:
                                          widgets.elementAt(1).description),
                                ))
                              : const SizedBox.shrink(),
                          SizedBox(
                            height: 8.w,
                          ),
                          widgets.length > 2
                              ? Expanded(
                                  child: GestureDetector(
                                  onTap: () {
                                    onItemSelected(2);
                                  },
                                  child: ImageWithTitleWidget(
                                      title: widgets.elementAt(2).title,
                                      imgPath: widgets.elementAt(2).imgPath,
                                      description:
                                          widgets.elementAt(2).description),
                                ))
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.w,
              ),
              widgets.length > 3
                  ? Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () {
                          onItemSelected(3);
                        },
                        child: ImageWithTitleWidget(
                            title: widgets.elementAt(3).title,
                            imgPath: widgets.elementAt(3).imgPath,
                            description: widgets.elementAt(3).description),
                      ))
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMapWidget() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(AppConstants.borderRadius32),
              bottomLeft: Radius.circular(AppConstants.borderRadius32)),
          child: SizedBox(
            height: 0.53.sh,
            child: MapWidget(
              
              myLocation: sn.latLng,
              markers: sn.markers.map((e) => e.marker).toSet(),
              onMapCreated: _getMyLocation,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: 1.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlurWidget(
                  height: 0.14.sh,
                  width: 0.86.sw,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildMapPinSearchWidget(
                            onPressed: sn.getShopsLocations,
                            color: AppColors.green,
                            iconPath: AppConstants.STORE_ICON,
                            text: Translation.of(context).stores,
                            selected: sn.shopsSelected),
                        _buildMapPinSearchWidget(
                            onPressed: sn.getRestaurantsLocations,
                            color: AppColors.blue,
                            iconPath: AppConstants.RESTAURANT_ICON,
                            text: Translation.of(context).healthy_restaurants,
                            selected: sn.restaurantsSelected),
                        // _buildMapPinSearchWidget(
                        //     onPressed: sn.getGymsLocations,
                        //     color: AppColors.red,
                        //     iconPath: AppConstants.BOXER_ICON,
                        //     text: Translation.of(context).gyms,
                        //     selected: sn.gymsSelected),
                        _buildMapPinSearchWidget(
                            onPressed: sn.getCoachesLocations,
                            color: AppColors.accentColorLight,
                            iconPath: AppConstants.WHISTLE_ICON,
                            text: Translation.of(context).sport_coaches,
                            selected: sn.coachesSelected),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalWidget({required List<CoachEntity> widgets}) {
    return SizedBox(
      width: 1.sw,
      height: 0.13.sh,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: widgets.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Nav.to(CoachProfileScreen.routeName,
                  arguments: widgets[index], context: context);
            },
            child: ImageWithTitleWidget(
              imgPath: widgets.elementAt(index).imageUrl ?? "",
              title: widgets.elementAt(index).name ?? "",
              description: widgets.elementAt(index).specialization!.text,
              width: 0.25.sw,
              height: 0.113.sh,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 16.w,
          );
        },
      ),
    );
  }

  Widget _buildShimmerContainerItem({double? height, double? width}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius4),
        color: AppColors.grey,
      ),
      width: width,
      height: height,
    );
  }

  Widget _buildSectionShimmer() {
    return SizedBox(
      width: 1.sw,
      height: 0.38.sh,
      child: Shimmer.fromColors(
          baseColor: AppColors.grey,
          highlightColor: AppColors.lightGrey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildShimmerContainerItem(height: 16.h, width: 0.2.sw),
                ],
              ),
              Gaps.vGap16,
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(child: _buildShimmerContainerItem()),
                    Gaps.hGap8,
                    Expanded(
                        child: Column(
                      children: [
                        Expanded(child: _buildShimmerContainerItem()),
                        Gaps.vGap8,
                        Expanded(child: _buildShimmerContainerItem()),
                      ],
                    )),
                  ],
                ),
              ),
              Gaps.vGap8,
              Expanded(child: _buildShimmerContainerItem())
            ],
          )),
    );
  }

  Widget _buildCoachesSectionShimmer() {
    return SizedBox(
      width: 1.sw,
      height: 0.38.sh,
      child: Shimmer.fromColors(
          baseColor: AppColors.grey,
          highlightColor: AppColors.lightGrey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildShimmerContainerItem(height: 16.h, width: 0.2.sw),
                ],
              ),
              Gaps.vGap16,
              Expanded(child: _buildShimmerContainerItem()),
            ],
          )),
    );
  }

  Widget _buildCoachesWidget(
      {required String title,
      required Function onSeeAllTapped,
      required List<CoachEntity> widgets}) {
    List<CoachEntity> list1 = [];
    List<CoachEntity> list2 = [];
    List<CoachEntity> list3 = [];

    _splitListIntoThree(widgets, list1, list2, list3);
    return Container(
      decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius12)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: TitleWidget(
                title: title,
                subtitleColorTapped: onSeeAllTapped,
                subtitle: Translation.of(context).see_all,
              ),
            ),
            list1.isNotEmpty
                ? Column(
                    children: [
                      Gaps.vGap16,
                      _buildHorizontalWidget(widgets: list1),
                    ],
                  )
                : const SizedBox.shrink(),
            list2.isNotEmpty
                ? Column(
                    children: [
                      Gaps.vGap16,
                      _buildHorizontalWidget(widgets: list2),
                    ],
                  )
                : const SizedBox.shrink(),
            list3.isNotEmpty
                ? Column(
                    children: [
                      Gaps.vGap16,
                      _buildHorizontalWidget(widgets: list3),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeScreenBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: 1.sw,
            height: 0.58.sh,
            child: _buildMapWidget(),
          ),
          Gaps.vGap40,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                BlocBuilder<CoachCubit, CoachState>(
                  bloc: sn.coachCubit,
                  builder: (context, state) {
                    return state.when(
                      coachInitState: () {
                        return const SizedBox.shrink();
                      },
                      coachLoadingState: () {
                        return _buildCoachesSectionShimmer();
                      },
                      coachErrorState: (error, callback) {
                        return const SizedBox.shrink();
                      },
                      getCoachesState: (CoachesEntity) {
                        return SizedBox(
                          width: 1.sw,
                          height: CoachesEntity.items!.length > 8
                              ? 0.54.sh
                              : CoachesEntity.items!.length > 5
                                  ? 0.37.sh
                                  : 0.23.sh,
                          child: _buildCoachesWidget(
                              title: Translation.of(context).most_rated_coaches,
                              widgets: CoachesEntity.items!,
                              onSeeAllTapped: _goToCoaches),
                        );
                      },
                    );
                  },
                ),
                Gaps.vGap40,
                BlocBuilder<CategoryCubit, CategoryState>(
                  bloc: sn.categoryCubit,
                  builder: (context, state) {
                    return state.when(
                      categoryInitState: () {
                        return const SizedBox.shrink();
                      },
                      categoryLoadingState: () {
                        return _buildSectionShimmer();
                      },
                      categoryErrorState: (error, callback) {
                        return const SizedBox.shrink();
                      },
                      getCategoriesState: (categoriesEntity) {
                        final List<TempWidget> categories = [];
                        categoriesEntity.items?.forEach((element) {
                          categories.add(TempWidget(
                            id: element.id ?? 0,
                            imgPath: element.iconUrl ?? '',
                            title: getTranslation(
                                context: context,
                                alternativeText: element.name,
                                enText: element.enName,
                                arText: element.arName),
                          ));
                        });
                        return SizedBox(
                          width: 1.sw,
                          height: 0.38.sh,
                          child: _buildSectionWidget(
                              title: Translation.of(context).categories,
                              widgets: categories,
                              onItemSelected: (index) {
                                _gotoCoachesScreen(
                                    categoriesEntity.items?.elementAt(index));
                              },
                              onSeeAllTapped: _goToCategories),
                        );
                      },
                    );
                  },
                ),
                Gaps.vGap40,
                BlocBuilder<RestaurantCubit, RestaurantState>(
                  bloc: sn.restaurantCubit,
                  builder: (context, state) {
                    return state.when(
                      restaurantInitState: () {
                        return const SizedBox.shrink();
                      },
                      restaurantLoadingState: () {
                        return _buildSectionShimmer();
                      },
                      restaurantErrorState: (error, callback) {
                        return const SizedBox.shrink();
                      },
                      getRestaurantsState: (restaurantsEntity) {
                        final List<TempWidget> categories0 = [];
                        restaurantsEntity.items?.forEach((element) {
                          categories0.add(
                            TempWidget(
                              id: element.id ?? 0,
                              imgPath: element.cover ?? '',
                              title: getTranslation(
                                context: context,
                                arText: element.arName,
                                enText: element.enName,
                                alternativeText: element.name,
                              ),
                              description: getTranslation(
                                context: context,
                                alternativeText: element.description,
                                enText: element.enDescription,
                                arText: element.arDescription,
                              ),
                            ),
                          );
                        });
                        return SizedBox(
                          width: 1.sw,
                          height: 0.38.sh,
                          child: _buildSectionWidget(
                            title: Translation.of(context).restaurants,
                            widgets: categories0,
                            onSeeAllTapped: () => _goToRestaurant(),
                            onItemSelected: (index) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => PlayingSliverState(
                                        restaurantEntity:
                                            restaurantsEntity.items![index],
                                      )));
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                Gaps.vGap40,
                BlocBuilder<ShopCubit, ShopState>(
                  bloc: sn.shopCubit,
                  builder: (context, state) {
                    return state.when(
                      shopInitState: () {
                        return const SizedBox.shrink();
                      },
                      shopLoadingState: () {
                        return _buildSectionShimmer();
                      },
                      shopErrorState: (error, callback) {
                        return const SizedBox.shrink();
                      },
                      getShopsState: (shopsEntity) {
                        final List<TempWidget> categories0 = [];
                        shopsEntity.items?.forEach((element) {
                          categories0.add(TempWidget(
                            id: element.id ?? 0,
                            imgPath: element.cover ?? '',
                            title: getTranslation(
                                context: context,
                                arText: element.arName,
                                enText: element.enName,
                                alternativeText: element.name),
                            description: getTranslation(
                                context: context,
                                alternativeText: element.description,
                                enText: element.enDescription,
                                arText: element.arDescription),
                          ));
                        });
                        return SizedBox(
                          width: 1.sw,
                          height: 0.38.sh,
                          child: _buildSectionWidget(
                            title: Translation.of(context).food_supplements,
                            widgets: categories0,
                            onSeeAllTapped: () => _goToShops(),
                            onItemSelected: (index) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return ShopDetails(
                                    shopsEntity: shopsEntity.items![index]);
                              }));
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 0.12.sh,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _goToCategories() {
    Nav.to(CategoryListScreen.routeName, context: context);
  }

  void _goToCoaches() {
    Nav.to(CoachesListScreen.routeName, context: context);
  }

  void _goToRestaurant() {
    Nav.to(RestaurantView.routeName, context: context);
  }

  void _goToShops() {
    Nav.to(ShopsView.routeName, context: context);
  }

  /// Logic

  void _gotoCoachesScreen(CategoryEntity? categoryEntity) {
    Nav.to(CoachesListScreen.routeName,
        arguments: categoryEntity, context: context);
  }

  void _splitListIntoThree(List list, List list1, List list2, List list3) {
    int count = 1;
    int divider = list.length ~/ 3;
    int addition = 0;
    int addition2 = 0;
    if (divider < 3) {
      divider = list.length ~/ 2;
      if (list.length % 2 != 0) addition = 1;
      if (divider < 3) {
        for (var element in list) {
          list1.add(element);
        }
      } else {
        for (var element in list) {
          if (count <= divider + addition) {
            list1.add(element);
          } else {
            list2.add(element);
          }
          count++;
        }
      }
    } else {
      if (list.length % 3 > 0) addition = 1;
      if (list.length % 3 == 2) addition2 = 1;
      for (var element in list) {
        if (count <= divider + addition) list1.add(element);
        if (count <= (divider) * 2 + addition + addition2 &&
            count > divider + addition) list2.add(element);
        if (count > (divider) * 2 + addition + addition2) list3.add(element);
        count++;
      }
    }
  }

  LatLng? latLang;

  void _getMyLocation() async {
    var locationData = await getMyLocation();
    if (locationData != null) {
      setState(() {
        sn.latLng = LatLng(locationData.latitude!, locationData.longitude!);
      });
      var prefs = await SpUtil.getInstance();
      if (locationData.latitude != null && locationData.longitude != null) {
        prefs.putDouble(AppConstants.KEY_LATITUDE, locationData.latitude!);
      }
      prefs.putDouble(AppConstants.KEY_LONGITUDE, locationData.longitude!);

      Provider.of<SessionDataProvider>(context, listen: false).myLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
    }
  }

  void _getNewLocation({required locationData}) async {
    if (locationData != null) {
      setState(() {
        latLang = LatLng(locationData.lat, locationData.lng);
        sn.latLng = LatLng(locationData.lat, locationData.lng);
      });
      var prefs = await SpUtil.getInstance();
      if (locationData.lat != null && locationData.lng != null) {
        prefs.putDouble(AppConstants.KEY_LATITUDE, locationData.lat);
      }
      prefs.putDouble(AppConstants.KEY_LONGITUDE, locationData.lng);

      Provider.of<SessionDataProvider>(context, listen: false).myLocation =
          LatLng(locationData.lat, locationData.lng);
    }
  }
}

class TempWidget {
  int id;
  String imgPath;
  String title;
  String? description;

  TempWidget(
      {required this.imgPath,
      required this.title,
      this.description,
      required this.id});
}
