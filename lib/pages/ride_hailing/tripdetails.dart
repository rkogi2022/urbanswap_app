import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripEndedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 16,
            child: Container(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(-1.286389, 36.817223),
                  zoom: 14,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 14,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Trip Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  buildDetailSection('Westlands Square', 'Kenyatta International Convention', context),
                  buildAmountSection('Ksh450', 'Cash', context),
                  SizedBox(height: 10),
                  buildButton('Cancel trip', () {
                    // Cancel trip logic
                  }, Color(0xFFE1E1E1), Colors.red),
                  buildMainButton('Done', () {
                    // Done logic
                  }, context, Color(0xFF003D8E), Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailSection(String start, String end, BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Icon(Icons.circle, size: 12, color: Colors.black),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.black,
                ),
                Icon(Icons.stop, size: 12, color: Colors.black),
              ],
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      start,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        end,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("Edit pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE3E3E3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Edit'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildAmountSection(String amount, String method, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person, size: 17, color: Color(0xFF003D8E)),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    amount,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    method,
                    style: TextStyle(color: Color(0xFF838383), fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              print("Switch pressed");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE3E3E3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('Switch'),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, VoidCallback onPressed, Color bgColor, Color textColor) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          elevation: 3,
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  Widget buildMainButton(String text, VoidCallback onPressed, BuildContext context, Color bgColor, Color textColor) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            elevation: 3,
          ),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
