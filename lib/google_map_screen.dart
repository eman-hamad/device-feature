import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatelessWidget {
  GoogleMapScreen({super.key});

//define cairo government location
  LatLng cairoLocation = const LatLng(30.0444, 31.2357);
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(
            child: const Text("Google Map",
                style: TextStyle(fontWeight: FontWeight.bold)),
          )),
      // show map with marker on cairo
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: cairoLocation,
          zoom: 9.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId("cairo_eg_marker"),
            position: LatLng(30.0444, 31.2357),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(title: "Cairo,Egypt"),
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),
    );
  }
}
