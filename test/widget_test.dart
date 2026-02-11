import 'package:quiz/model/ride/locations.dart';
import 'package:quiz/services/rides_service.dart';

void main (){
  RidesService.filterBy(
    departure: Location(name: "Dijon", country: Country.france),
    seatRequested:2
  );
}