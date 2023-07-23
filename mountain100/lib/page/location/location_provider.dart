import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final currentLocationProvider =
    StateProvider<LatLng>((ref) => LatLng(37.5642135, 127.0016985));
final locationProvider =
    Provider<LocationPageProvider>((ref) => LocationPageProvider(ref: ref));

abstract class LocationPageProviderInterface {
  getCurrentLocation();

  moveToCurrentLocation(GoogleMapController controller);
}

class LocationPageProvider with LocationPageProviderInterface {
  final ProviderRef ref;

  LocationPageProvider({required this.ref});

  @override
  getCurrentLocation() async {
    var position = await GeolocatorPlatform.instance.getCurrentPosition();
    ref.read(currentLocationProvider.notifier).state =
        LatLng(position.latitude, position.longitude);
  }

  @override
  moveToCurrentLocation(GoogleMapController controller) {
    controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
      zoom: 16,
        target: ref.read(currentLocationProvider.notifier).state)));
  }
}
