import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../datasource/home_remote.dart';
import '../model/request/place_direction.dart';
import '../model/request/place_suggestation.dart';
import '../model/request/places.dart';

class PlaceSuggestationRepo {
  final PlacesWebServices placesWebServices;

  PlaceSuggestationRepo(this.placesWebServices);

  Future<List<PlaceSuggestation>> fetchPlaceSuggestationRepo(
      String place, String sessionToken) async {
    final suggestions =
        await placesWebServices.fetchSuggestions(place, sessionToken);
    return suggestions
        .map((suggestion) => PlaceSuggestation.fromJson(suggestion))
        .toList();
  }

  Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
    final place =
        await placesWebServices.getPlaceLocation(placeId, sessionToken);
    return Place.fromJson(place);
  }

  Future<PlaceDirections> getDirections(
      LatLng origin, LatLng destination) async {
    final directions =
        await placesWebServices.getDirections(origin, destination);

    return PlaceDirections.fromJson(directions);
  }
}
