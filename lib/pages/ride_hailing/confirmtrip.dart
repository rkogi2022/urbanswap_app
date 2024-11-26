import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConfirmPickUpPage extends StatefulWidget {
  @override
  _ConfirmPickUpPageState createState() => _ConfirmPickUpPageState();
}

class _ConfirmPickUpPageState extends State<ConfirmPickUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(-1.286389, 36.817223), // Example coordinates for Nairobi
                  zoom: 14,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20), // Added spacing to move content upwards
                  Text(
                    'Connecting you to a driver',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Confirming driver details',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => Container(
                        width: 20,
                        height: 2,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        color: Color.fromARGB(255, 21, 33, 205),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Handle View trip details click
                    },
                    child: Text(
                      'View trip details',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Spacer(), // Added spacer to push content upwards
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20), // Increased top padding
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF003D8E),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Confirm Pickup point',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
