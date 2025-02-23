import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/foundation.dart'; // For debugPrint

class GetLocationService {
  Future<String?> getCityNameFromCurrentLocation() async {
    try {
      // Step 1: Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint("Location services are disabled.");
        return null; // Tell user to enable location services
      }

      // Step 2: Check and request permission
      LocationPermission permission = await Geolocator.checkPermission();
      
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      
      if (permission == LocationPermission.deniedForever) {
        debugPrint("Location permission is permanently denied.");
        return null; // Recommend user to go to settings
      }

      // Step 3: Get the current position
      Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.best,
      );
      debugPrint("Location: ${position.latitude}, ${position.longitude}");

      // Step 4: Convert coordinates to placemark (city name)
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Step 5: Extract city name
      String cityName = placemarks.isNotEmpty ? (placemarks[0].locality ?? "Unknown City") : "Unknown City";
      debugPrint("Detected city: $cityName");

      return cityName;
      
    } catch (error, stacktrace) {
      debugPrint("Error fetching location: $error");
      debugPrint("Stacktrace: $stacktrace");
      return null; // Handle error gracefully
    }
  }
}
