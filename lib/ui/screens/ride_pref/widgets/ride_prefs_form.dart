import 'package:flutter/material.dart';
import 'package:quiz/ui/widgets/actions/BlaButton.dart';
import '../../../widgets/inputs/SubBlaForm.dart';
import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location departure = Location(
    name: "Toulouse",
    country: Country.france,
  );
  Location arrival = Location(
    name: "Bordeaux, France",
    country: Country.france,
  );
  late DateTime departureDate;
  late int seat;

  @override
  void initState() {
    super.initState();
    departureDate = DateTime.now();
    seat = 1;
  }

  void _swapLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Swap arrow aligned to top-right
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: _swapLocations,
                child: Icon(
                  Icons.swap_vert,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          SubBla(icon: Icons.location_city, label: departure.name),
          const SizedBox(height: 12),

          SubBla(icon: Icons.location_city, label: arrival.name),
          const SizedBox(height: 12),

          SubBla(
            icon: Icons.punch_clock,
            label:
                "${departureDate.day}/${departureDate.month}/${departureDate.year}",
          ),
          const SizedBox(height: 12),

          SubBla(icon: Icons.people, label: "$seat"),
          const SizedBox(height: 30),

          Blabutton(
            label: 'Contact Volodia',
            color: Colors.blue,
            onTap: () {
              print("Departure: ${departure.name}");
              print("Arrival: ${arrival.name}");
              print("Date: $departureDate");
            },
          ),
        ],
      ),
    );
  }
}