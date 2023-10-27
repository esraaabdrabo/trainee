import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:upgrade_traine_project/core/ui/widgets/waiting_widget.dart';

import '../../constants/app/app_constants.dart';

class MapDetails extends StatefulWidget {
  final LatLng latLng;

  const MapDetails({Key? key, required this.latLng}) : super(key: key);

  @override
  State<MapDetails> createState() => MapDetailsState();
}

class MapDetailsState extends State<MapDetails> {
  late final GoogleMapController _controller;
  late final String mapStyle;
  late final BitmapDescriptor? customIcon;

  bool isInitialized = true;

  Future<void> _init() async {
    if (isInitialized) {
      mapStyle = await rootBundle.loadString(AppConstants.MAP_STYLE_JSON);
      await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(30.w, 45.h)),
              AppConstants.MARKER_ICON)
          .then((d) {
        customIcon = d;
      });
    }
    setState(() {
      isInitialized = false;
    });
  }

  void _setMapStyle() {
    _controller.setMapStyle(mapStyle);
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return !isInitialized
        ? GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: widget.latLng,
              zoom: 14.4746,
            ),
            gestureRecognizers: Set()
              ..add(Factory<EagerGestureRecognizer>(
                  () => EagerGestureRecognizer())),
            zoomControlsEnabled: true,
            markers: {
              Marker(
                  markerId: MarkerId(widget.latLng.toString()),
                  position: widget.latLng,
                  //widget.myLocation!,
                  icon: BitmapDescriptor.defaultMarker)
            },
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              _setMapStyle();
            },
          )
        : WaitingWidget();
  }
}
