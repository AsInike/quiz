import 'package:flutter/material.dart';
import 'package:quiz/ui/widgets/actions/BlaButton.dart';
import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../widgets/inputs/SubBlaForm.dart';

class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  Location? arrival;

  late DateTime departureDate;
  late int seat;

  @override
  void initState() {
    super.initState();
    departure = null;
    arrival = null;
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

          SubBla(icon: Icons.place,label: departure?.name),
          const SizedBox(height: 12,child: Divider()),

          SubBla(icon: Icons.place,label: arrival?.name),
          const SizedBox(height: 12,child: Divider()),

          SubBla(
            icon: Icons.calendar_month,
            label:
                "${departureDate.day}/${departureDate.month}/${departureDate.year}",
          ),
          const SizedBox(height: 12,child: Divider()),

          SubBla(icon: Icons.person, label: "$seat"),
          const SizedBox(height: 30),

          Blabutton(
            label: 'Search',
            color: Colors.blue,
            onTap: () {
              print("tab");
            },
          ),
        ],
      ),
    );
  }
}