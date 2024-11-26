import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverArrivedPage extends StatelessWidget {
  final LatLng nairobi = LatLng(-1.286389, 36.817223);
  final LatLng nakuru = LatLng(-0.303098, 36.080477);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  (nairobi.latitude + nakuru.latitude) / 2,
                  (nairobi.longitude + nakuru.longitude) / 2,
                ),
                zoom: 7,
              ),
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: [nairobi, nakuru],
                  color: Colors.red,
                  width: 3,
                ),
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your driver has arrived',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Meet Silas outside',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 20,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/driver.png',
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '4.5',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 80,
                        child: Image.asset(
                          'assets/images/alto.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'KDE 123F',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Suzuki Alto',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    'Silas Barasa',
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 13,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEDEDED),
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text(
                      'Chat with Silas',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEDEDED),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                    child: Icon(Icons.call, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
