import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../features/home/domain/entity/specializations_entity.dart';

@singleton
class SessionDataProvider extends ChangeNotifier {
  late SpecializationsEntity specializationsEntity;
  LatLng? myLocation;
  String? sharedStoryId;
}
