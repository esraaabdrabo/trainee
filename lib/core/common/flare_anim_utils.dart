/*
import '../../../core/constants.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/services.dart';

const _usedAnimations = [
];

Future<bool> cacheFlareAnimations() async {
  for (final filename in _usedAnimations) {
    final assetProvider = await AssetFlare(
      bundle: rootBundle,
      name: filename,
    );
    await cachedActor(assetProvider);
  }
  return true;
}

Future<bool> cacheSpecificAnimation(String animationPath) async {
  final assetProvider = await AssetFlare(
    bundle: rootBundle,
    name: animationPath,
  );
  await cachedActor(assetProvider);
  return true;
}
*/
