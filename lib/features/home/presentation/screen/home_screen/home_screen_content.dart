import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/home_map.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/home_sections/coaches.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/shimmer/container_item.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/session_data.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/utils.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/datasources/shared_preference.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../../core/ui/widgets/image_with_title_widget.dart';
import '../../../../../core/ui/widgets/title_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../category/domain/entity/category_entity.dart';
import '../../../../category/presentation/screen/category_list_screen.dart';
import '../../../../category/presentation/state_m/cubit/category_cubit.dart';
import '../../../../coach/presentation/screen/coaches_list_screen.dart';
import '../../../../restaurant/presentation/screen/restaurant_details.dart';
import '../../../../restaurant/presentation/screen/all_restaurants.dart';
import '../../../../restaurant/presentation/state_m/cubit/restaurant_cubit.dart';
import '../../../../shop/presentation/screen/shop_details.dart';
import '../../../../shop/presentation/screen/shops_view.dart';
import '../../../../shop/presentation/state_m/cubit/shop_cubit.dart';
import '../../../data/model/request/place_suggestation.dart';
import '../../state_m/bloc/maps_cubit.dart';
import '../../state_m/provider/home_screen_notifier.dart';
import '../../widget/place_item.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  late HomeScreenNotifier sn;
  List<PlaceSuggestation> places = [];
  late PlaceSuggestation placeSuggestion;

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
          places = state.places;
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
    final sessionToken = const Uuid().v4();
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
          margin: EdgeInsets.only(top: .15.sh),
          height: .9.sh,
          child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    color: AppColors.grey,
                    indent: .15.sw,
                  ),
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
              padding: EdgeInsets.symmetric(horizontal: .01.sw),
              physics: const ClampingScrollPhysics()),
        );
      },
    );
  }

  Widget _buildHomeScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          _buildHomeScreenBody(context),
          buildSuggestionsBloc(),
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
                            onTap: () => onItemSelected(0),
                            child: ImageWithTitleWidget(
                                title: widgets.elementAt(0).title,
                                imgPath: widgets.elementAt(0).imgPath,
                                description: widgets.elementAt(0).description),
                          ))
                        : const SizedBox.shrink(),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          widgets.length > 1
                              ? Expanded(
                                  child: GestureDetector(
                                  onTap: () => onItemSelected(1),
                                  child: ImageWithTitleWidget(
                                      title: widgets.elementAt(1).title,
                                      imgPath: widgets.elementAt(1).imgPath,
                                      description:
                                          widgets.elementAt(1).description),
                                ))
                              : const SizedBox.shrink(),
                          SizedBox(height: 8.w),
                          widgets.length > 2
                              ? Expanded(
                                  child: GestureDetector(
                                  onTap: () => onItemSelected(2),
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
              SizedBox(height: 8.w),
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
                  ShimmerContainerItem(height: 16.h, width: 0.2.sw),
                ],
              ),
              Gaps.vGap16,
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(child: ShimmerContainerItem()),
                    Gaps.hGap8,
                    Expanded(
                        child: Column(
                      children: [
                        const Expanded(child: ShimmerContainerItem()),
                        Gaps.vGap8,
                        const Expanded(child: ShimmerContainerItem()),
                      ],
                    )),
                  ],
                ),
              ),
              Gaps.vGap8,
              const Expanded(child: ShimmerContainerItem())
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
                  ShimmerContainerItem(height: 16.h, width: 0.2.sw),
                ],
              ),
              Gaps.vGap16,
              const Expanded(child: ShimmerContainerItem()),
            ],
          )),
    );
  }

  Widget _buildHomeScreenBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeAppbar(controller: sn.searchTextController),
          const HomeMapWidget(),
          Gaps.vGap40,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                const HomeCoachesSetions(),
                Gaps.vGap40,
                BlocBuilder<CategoryCubit, CategoryState>(
                  bloc: sn.categoryCubit,
                  builder: (context, state) => state.when(
                    categoryInitState: () => const SizedBox.shrink(),
                    categoryLoadingState: () => _buildSectionShimmer(),
                    categoryErrorState: (error, callback) =>
                        const SizedBox.shrink(),
                    getCategoriesState: (categoriesEntity) {
                      final List<TempWidget> categories = [];
                      categoriesEntity.items?.forEach(
                        (element) => categories.add(
                          TempWidget(
                            id: element.id ?? 0,
                            imgPath: element.iconUrl ?? '',
                            title: getTranslation(
                              context: context,
                              alternativeText: element.name,
                              enText: element.enName,
                              arText: element.arName,
                            ),
                          ),
                        ),
                      );
                      return SizedBox(
                        width: 1.sw,
                        height: 0.38.sh,
                        child: _buildSectionWidget(
                            title: Translation.of(context).categories,
                            widgets: categories,
                            onItemSelected: (index) => _gotoCoachesScreen(
                                categoriesEntity.items?.elementAt(index)),
                            onSeeAllTapped: _goToCategories),
                      );
                    },
                  ),
                ),
                Gaps.vGap40,
                BlocBuilder<RestaurantCubit, RestaurantState>(
                  bloc: sn.restaurantCubit,
                  builder: (context, state) => state.when(
                    hideSearch: () => const SizedBox(),
                    showSearch: () => const SizedBox(),
                    restaurantInitState: () => const SizedBox.shrink(),
                    restaurantLoadingState: () => _buildSectionShimmer(),
                    restaurantErrorState: (error, callback) =>
                        const SizedBox.shrink(),
                    getRestaurantsState: (restaurantsEntity) {
                      final List<TempWidget> categories0 = [];
                      restaurantsEntity.items
                          ?.forEach((element) => categories0.add(
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
                              ));
                      return SizedBox(
                        width: 1.sw,
                        height: 0.38.sh,
                        child: _buildSectionWidget(
                          title: Translation.of(context).restaurants,
                          widgets: categories0,
                          onSeeAllTapped: () => _goToRestaurant(),
                          onItemSelected: (index) =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => PlayingSliverState(
                                        restaurantEntity:
                                            restaurantsEntity.items![index],
                                      ))),
                        ),
                      );
                    },
                  ),
                ),
                Gaps.vGap40,
                BlocBuilder<ShopCubit, ShopState>(
                  bloc: sn.shopCubit,
                  builder: (context, state) {
                    return state.when(
                      hideSearch: () => const SizedBox(),
                      showSearch: () => const SizedBox(),
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

      BlocProvider.of<MapsCubit>(context)
          .controller
          .moveCamera(CameraUpdate.newLatLng(sn.latLng!));
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
