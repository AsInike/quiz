import 'package:quiz/model/ride_pref/ride_pref.dart';

import '../data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///

class RidesService {
  static List<Ride> allRides = fakeRides;

  static List<Ride> filterByDeparture(Location departure) {
    return allRides
        .where((ride) => ride.departureLocation == departure)
        .toList();
  }

  static List<Ride> filterBySeatRequested(int seatRequested) {
    return allRides
        .where((ride) => ride.availableSeats >= seatRequested)
        .toList();
  }

  static List<Ride> filterBy({
    Location? departure,
    int? seatRequested,
  }) {
    return allRides.where((ride) {
      final matchDeparture =
          departure == null || ride.departureLocation == departure;

      final matchSeats =
          seatRequested == null || ride.availableSeats >= seatRequested;

      return matchDeparture && matchSeats;
    }).toList();
  }
  
}
