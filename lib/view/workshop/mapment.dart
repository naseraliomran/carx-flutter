import 'package:flutter/foundation.dart';
import 'package:car_x/view/workshop/mentview.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapsample extends StatefulWidget {
  const Mapsample({super.key});

  @override
  State<Mapsample> createState() => MapsampleState();
}

getallmentcontroller controller = Get.put(
  getallmentcontroller(),
);

class MapsampleState extends State<Mapsample> {
  late LatLng _center;
  late Position currentLocation;
  List<Marker> mymarker = [];

  Marker locat = Marker(
    markerId: MarkerId("point"),
    position: LatLng(33, 36),
  );

  @override
  void initState() {
    determinePosition();

    setState(() {
      getUserLocation();
    });
    super.initState();
  }

  GoogleMapController? _controller;
  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();

    _center = LatLng(currentLocation.latitude, currentLocation.longitude);

    if (kDebugMode) debugPrint('center $_center');

    _kGooglePlex = CameraPosition(
      target: _center,
      zoom: 14.4746,
    );
    setState(() {});
  }

  CameraPosition? _kGooglePlex;

  Future determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "الخرائط",
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "تم",
                  style: Theme.of(context).textTheme.displaySmall,
                )),
          ],
        ),
      ),
      body: _kGooglePlex == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              zoomControlsEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex as CameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              markers: {locat},
            ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            _controller?.animateCamera(CameraUpdate.newLatLng(
              _center,
            ));
            if (kDebugMode) debugPrint(_center);
          },
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "موقعي",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                width: 12,
              ),
              Icon(Icons.gps_fixed)
            ],
          )),
    );
  }
}
