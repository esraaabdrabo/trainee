import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:upgrade_traine_project/core/ui/toast.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/ui/widgets/waiting_widget.dart';
import '../../../features/home/presentation/state_m/bloc/maps_cubit.dart';

class MapWidget extends StatefulWidget {
  final LatLng? myLocation;
  final LatLng? newLatLng;
  final Set<Marker>? markers;
  final Function? onMapCreated;
  static const String _myLocationMarkerId = 'myLocation';

  const MapWidget(
      {super.key,
      this.myLocation,
      this.markers,
      this.onMapCreated,
      this.newLatLng});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Set<Marker> markers = {};
  late final BitmapDescriptor? customIcon;

  late final String mapStyle;
  bool isInitialized = true;
  bool myLocationSet = false;

  final LatLng _defaultLocation = const LatLng(24.76, 46.73);

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
    setState(() => isInitialized = false);
    _setMyLocation();
  }

  void _setMapStyle() {
    BlocProvider.of<MapsCubit>(context).controller.setMapStyle(mapStyle);
  }

  @override
  void initState() {
    super.initState();
    _init();
    _setMyLocation();
  }

  void _setMyLocation() {
    markers = {};
    if (widget.myLocation != null) {
      markers.removeWhere((element) =>
          element.markerId == const MarkerId(MapWidget._myLocationMarkerId));
      markers.add(Marker(
          markerId: const MarkerId(MapWidget._myLocationMarkerId),
          position: widget.myLocation!,
          icon: customIcon ?? BitmapDescriptor.defaultMarker));
    }
    if (widget.markers != null) {
      for (var element in widget.markers!) {
        markers.add(element);
      }
    }
    Toast.show(
        "${widget.myLocation} ${!isInitialized && !myLocationSet && widget.myLocation != null}");

    if (!isInitialized && !myLocationSet && widget.myLocation != null) {
      BlocProvider.of<MapsCubit>(context)
          .controller
          .moveCamera(CameraUpdate.newLatLng(widget.myLocation!));
      myLocationSet = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return !isInitialized
        ? BlocBuilder<MapsCubit, MapsState>(
            builder: (context, state) {
              return GoogleMap(
                onMapCreated: (controller) {
                  BlocProvider.of<MapsCubit>(context).controller = controller;
                  _setMapStyle();
                  if (widget.onMapCreated != null) {
                    widget.onMapCreated!();
                  }
                },
                initialCameraPosition: CameraPosition(
                    target: widget.myLocation ?? _defaultLocation, zoom: 16),
                gestureRecognizers: Set()
                  ..add(Factory<EagerGestureRecognizer>(
                      () => EagerGestureRecognizer())),
                zoomControlsEnabled: false,
                markers: markers,
              );
            },
          )
        : WaitingWidget();
  }
}
