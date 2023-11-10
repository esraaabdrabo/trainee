import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_appbar.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/widgets/custom_button.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _userLocation;
  late final String mapStyle;

  @override
  void initState() {
    super.initState();
    _init();
    // Get the user's current location when the screen loads
    _getUserLocation();
  }

  _init() async {
    mapStyle = await rootBundle.loadString(AppConstants.MAP_STYLE_JSON);
  }

  Future<void> _getUserLocation() async {
    // Check for location permissions and request them if needed
    var locationPermission = await Geolocator.requestPermission();
    if (locationPermission != LocationPermission.denied) {
      // Get the user's current location using the Geolocator package
      var position = await Geolocator.getCurrentPosition();
      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
      });
    }
  }

  LatLng? markerPosition;

  void _handleMapTap(LatLng position) {
    setState(() {
      markerPosition = position;
    });
  }

  late GoogleMapController _controller;

  void _setMapStyle() {
    _controller.setMapStyle(mapStyle);
  }

  willScope() {
    Navigator.pop(context, markerPosition ?? _userLocation);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willScope(),
      child: Scaffold(
        appBar: TransparentAppBar(
            title: LanguageHelper.tr(context).current_location),
        body: _userLocation == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    markers: {
                      Marker(
                          markerId: MarkerId(markerPosition.toString()),
                          position: markerPosition ?? _userLocation!,
                          //widget.myLocation!,
                          icon: BitmapDescriptor.defaultMarker)
                    },
                    onMapCreated: (controller) {
                      _controller = controller;
                      _setMapStyle();
                    },
                    initialCameraPosition: CameraPosition(
                      target: _userLocation!,
                      zoom: 15,
                    ),
                    onTap: _handleMapTap,
                  ),
                  Positioned(
                    top: 600.h,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomElevatedButton(
                        size: Size(350.w, 50),
                        onTap: () {
                          Navigator.pop(
                              context, markerPosition ?? _userLocation);
                        },
                        text: "Pick Location",
                        borderRadius: 10,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
