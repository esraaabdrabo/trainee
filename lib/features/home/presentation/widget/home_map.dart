import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/ui/widgets/blur_widget.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/core/ui/widgets/google_map_widget.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/maps_cubit.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/provider/home_screen_notifier.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/session_data.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/utils.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/datasources/shared_preference.dart';
import '../../../../../generated/l10n.dart';

class HomeMapWidget extends StatefulWidget {
  const HomeMapWidget({super.key});

  @override
  State<HomeMapWidget> createState() => _BuildMapWidgetState();
}

class _BuildMapWidgetState extends State<HomeMapWidget> {
  @override
  Widget build(BuildContext context) {
    Widget buildMapPinSearchWidget(
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

    var sn = Provider.of<HomeScreenNotifier>(context);
    sn.context = context;
    void _getMyLocation() async {
      var locationData = await getMyLocation();
      if (locationData != null) {
        setState(() {
          sn.latLng = LatLng(locationData.latitude!, locationData.longitude!);
          sn.markers.add(CustomMarker(
              type: MarkerType.myLocation,
              marker: Marker(
                  markerId: MarkerId("my_location"), position: sn.latLng!)));
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

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(AppConstants.borderRadius32),
              bottomLeft: Radius.circular(AppConstants.borderRadius32)),
          child: SizedBox(
            height: 0.53.sh,
            child: MapWidget(
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
                        buildMapPinSearchWidget(
                          onPressed: () async {
                            await sn.getShopsLocations();
                            BlocProvider.of<MapsCubit>(context).update();
                          },
                          color: AppColors.green,
                          iconPath: AppConstants.STORE_ICON,
                          text: Translation.of(context).stores,
                          selected: sn.shopsSelected,
                        ),
                        buildMapPinSearchWidget(
                          onPressed: sn.getRestaurantsLocations,
                          color: AppColors.blue,
                          iconPath: AppConstants.RESTAURANT_ICON,
                          text: Translation.of(context).healthy_restaurants,
                          selected: sn.restaurantsSelected,
                        ),
                        // buildMapPinSearchWidget(
                        //     onPressed: sn.getGymsLocations,
                        //     color: AppColors.red,
                        //     iconPath: AppConstants.BOXER_ICON,
                        //     text: Translation.of(context).gyms,
                        //     selected: sn.gymsSelected),
                        buildMapPinSearchWidget(
                          onPressed: sn.getCoachesLocations,
                          color: AppColors.accentColorLight,
                          iconPath: AppConstants.WHISTLE_ICON,
                          text: Translation.of(context).sport_coaches,
                          selected: sn.coachesSelected,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: IconButton(
                onPressed: () {
                  BlocProvider.of<MapsCubit>(context).controller.animateCamera(
                      CameraUpdate.newLatLng(
                          LatLng(sn.latLng!.latitude, sn.latLng!.longitude)));
                },
                icon: const Icon(
                  Icons.my_location,
                  color: Colors.white,
                )))
      ],
    );
  }
}
