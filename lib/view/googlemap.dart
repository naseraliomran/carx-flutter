import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:car_x/control/worksope/workshope_controller.dart'; // Assuming this path is correct
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart'; // Assuming GetX is used for state management/navigation
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  // State variables for UI management
  bool _isLoading = true;
  String? _errorMessage;

  late LatLng _center; // Will be initialized after getting location
  Position? currentLocation; // Make nullable initially
  List<Marker> mymarker = [];

  // Assuming workashopcontrol is a GetX controller
  // Ensure it's correctly initialized if it's crucial before map loads
  workashopcontrol controller = Get.put(workashopcontrol());

  var lat; // Consider making these nullable: double? lat;
  var long; // double? long;

  GoogleMapController? _googleMapController;
  CameraPosition? _kGooglePlex;

  @override
  void initState() {
    super.initState();
    _initializeMapData();
  }

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  Future<void> _initializeMapData() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // 1. Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'Location services are disabled. Please enable them in your device settings to use the map.';
      }

      // 2. Check and request location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied. Please grant access in your app settings to use the map.';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw 'Location permissions are permanently denied. Please enable them in your app settings to use the map.';
      }

      // 3. If permissions are granted, get the current position
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      _center = LatLng(currentLocation!.latitude, currentLocation!.longitude);

      _kGooglePlex = CameraPosition(
        target: _center,
        zoom: 14, // Adjusted zoom for better initial view
      );

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString();
        });
      }
      if (kDebugMode) debugPrint("Error initializing map: $e");
    }
  }

  void _handleTap(LatLng point) {
    if (!mounted) return;
    setState(() {
      lat = point.latitude;
      long = point.longitude;
      mymarker = [
        Marker(
          markerId: MarkerId("selected_location"), // More descriptive ID
          position: point,
          draggable: true,
          onDragEnd: (draggedLatLng) {
            if (mounted) {
              setState(() {
                lat = draggedLatLng.latitude;
                long = draggedLatLng.longitude;
              });
            }
            if (kDebugMode) debugPrint("Marker dragged to: $draggedLatLng");
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure), // Custom marker color
        )
      ];
    });
    if (kDebugMode) debugPrint("Tapped at: $point");
  }

  void _goToCurrentUserLocation() {
    if (currentLocation != null && _googleMapController != null) {
      final newLatLng =
          LatLng(currentLocation!.latitude, currentLocation!.longitude);
      _googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: newLatLng, zoom: 16), // Zoom in a bit more
        ),
      );
      // Optionally, place a marker at the current location if not already done by _handleTap
      // _handleTap(newLatLng);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false, // Assuming this is intentional
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "الخرائط", // Maps
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: (lat != null && long != null)
                  ? () {
                      // Enable only if a location is selected
                      controller.lat = lat;
                      controller.long = long;
                      Get.back(); // Navigate back using GetX
                    }
                  : null, // Disable button if no location is picked
              child: Text(
                "تم", // Done
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
      ),
      body: _buildBody(),
      floatingActionButton: (_isLoading || _errorMessage != null)
          ? null
          : FloatingActionButton.extended(
              onPressed: _goToCurrentUserLocation,
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "موقعي", // My Location
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(width: 8), // Reduced spacing
                  Icon(Icons
                      .my_location), // Changed icon to a more common one for "my location"
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 60),
              SizedBox(height: 20),
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.red[700]),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.refresh),
                label: Text("Retry"),
                onPressed: _initializeMapData, // Retry fetching location
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 10),
              TextButton.icon(
                icon: Icon(Icons.settings),
                label: Text("Open App Settings"),
                onPressed: () {
                  Geolocator
                      .openAppSettings(); // Opens app settings for permission changes
                },
              )
            ],
          ),
        ),
      );
    }

    if (_kGooglePlex == null) {
      // This case should ideally be covered by _isLoading or _errorMessage
      // but as a fallback:
      return Center(
        child: Text("Map could not be initialized. Please try again."),
      );
    }

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex!, // Safe to use ! due to checks above
      onMapCreated: (GoogleMapController controller) {
        if (!mounted) return;
        _googleMapController = controller;
      },
      markers: Set.of(mymarker),
      onTap: _handleTap,
      zoomControlsEnabled: true,
      myLocationButtonEnabled:
          false, // Disable default one as we have a custom FAB
      myLocationEnabled: true, // Shows the blue dot for user's current location
    );
  }
}
