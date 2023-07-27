import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mountain100/page/info/info_provider.dart';
import 'package:mountain100/page/location/location_provider.dart';

class LocationPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationPageState();
}

class _LocationPageState extends ConsumerState<LocationPage> {

  late LocationPageProvider provider;
  late GoogleMapController _googleMapController;
  @override
  void initState() {
    provider=ref.read(locationProvider);
  }

  @override
  Widget build(BuildContext context) {
    final currentPos = ref.read(currentLocationProvider);
    provider.getCurrentLocation();
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          onMapCreated: (controller)  {
            provider.moveToCurrentLocation(controller);
          },
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(zoom: 16, target: currentPos),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              onPressed: (){},
              child: Text("긴급 구조 요청하기"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
          ),
        )
      ]),
    );
  }

}
