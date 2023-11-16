import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../../data/model/request/place_direction.dart';
import '../../../data/model/request/place_suggestation.dart';
import '../../../data/model/request/places.dart';
import '../../../data/repository/place_suggestation.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final PlaceSuggestationRepo placeSuggestationRepo;

  MapsCubit(this.placeSuggestationRepo) : super(MapsInitial());
  
  void emitPlaceSuggestion(String place) {
    placeSuggestationRepo
        .fetchPlaceSuggestationRepo(place, const Uuid().v4())
        .then((places) {
      emit(MapsPlacesLoaded(places));
    });
  }

  void emitPlaceLocation(String placeId, String sessionToken) {
    placeSuggestationRepo.getPlaceLocation(placeId, sessionToken).then((place) {
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(
            place.result.geometry.location.lat,
            place.result.geometry.location.lng,
          ),
          zoom: 12)));
      emit(PlaceLocationLoaded(place));
    });
  }

  void emitPlaceDirections(LatLng origin, LatLng destination) {
    placeSuggestationRepo.getDirections(origin, destination).then((directions) {
      emit(DirectionsLoaded(directions));
    });
  }

  late GoogleMapController controller;
}
