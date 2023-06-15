import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(28.623652813554123, 77.03575899599221),zoom: 14),
      )
    );
  }
}