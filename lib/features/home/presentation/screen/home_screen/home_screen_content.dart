import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/home_map.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/home_sections/categories.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/home_sections/coaches.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/home_sections/restaurants.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/home_sections/shops.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/session_data.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/datasources/shared_preference.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
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

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          _Body(sn),
          buildSuggestionsBloc(),
        ],
      ),
    );
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

  LatLng? latLang;

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

class _Body extends StatelessWidget {
  const _Body(this.sn);
  final HomeScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
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
                const HomeCategoriesSection(),
                Gaps.vGap40,
                const HomeRestaurantsSection(),
                Gaps.vGap40,
                const HomeShopsSection(),
                SizedBox(height: 0.12.sh),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
