// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/common/session_data.dart';
import 'package:upgrade_traine_project/core/common/style/gaps.dart';
import 'package:upgrade_traine_project/core/common/utils.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/datasources/shared_preference.dart';
import 'package:upgrade_traine_project/core/ui/widgets/blur_widget.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/core/ui/widgets/google_map_widget.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/provider/home_screen_notifier.dart';
import 'package:upgrade_traine_project/generated/l10n.dart';

class HomeMapWidget extends StatefulWidget {
  const HomeMapWidget({super.key});

  @override
  State<HomeMapWidget> createState() => _HomeMapWidgetState();
}

class _HomeMapWidgetState extends State<HomeMapWidget> {
  void _getMyLocation(BuildContext context) async {
    Position? locationData = await getMyLocation();
    if (locationData != null) {
      Provider.of<HomeScreenNotifier>(context,listen: false).latLng =
          LatLng(locationData.latitude, locationData.longitude);
      var prefs = await SpUtil.getInstance();
      prefs.putDouble(AppConstants.KEY_LATITUDE, locationData.latitude);
      prefs.putDouble(AppConstants.KEY_LONGITUDE, locationData.longitude);
      Provider.of<SessionDataProvider>(context, listen: false).myLocation =
          LatLng(locationData.latitude, locationData.longitude);
    }
  }

  @override
  void initState() {
    super.initState();
    _getMyLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    var sn = Provider.of<HomeScreenNotifier>(context);

    return sn.latLng == null
        ? FutureBuilder<Position?>(
            future: getMyLocation(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? SizedBox(
                      height: 0.53.sh,
                      child: MapWidget(
                        myLocation: sn.latLng,
                        markers: sn.markers.map((e) => e.marker).toSet(),
                        //   onMapCreated: _getMyLocation,
                      ),
                    )
                  : _Map(
                      sn: sn,
                      latLng: LatLng(
                          snapshot.data!.latitude, snapshot.data!.longitude));
            })
        : _Map(
            sn: sn,
            latLng: sn.latLng!,
          );
  }
}

class _Map extends StatelessWidget {
  const _Map({
    required this.sn,
    required this.latLng,
  });
  final LatLng latLng;
  final HomeScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(AppConstants.borderRadius32),
              bottomLeft: Radius.circular(AppConstants.borderRadius32)),
          child: SizedBox(
            height: 0.53.sh,
            child: MapWidget(
              myLocation: latLng,
              markers: sn.markers.map((e) => e.marker).toSet(),
              //   onMapCreated: _getMyLocation,
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
