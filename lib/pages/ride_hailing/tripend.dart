import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripEndedPage extends StatefulWidget {
  @override
  _TripEndedPageState createState() => _TripEndedPageState();
}

class _TripEndedPageState extends State<TripEndedPage> {
  int rating = 0;

  void handleStarClick(int value) {
    setState(() {
      rating = value;
    });
  }

  List<Widget> renderStars() {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      stars.add(
        GestureDetector(
          onTap: () => handleStarClick(i),
          child: Icon(
            rating >= i ? Icons.star : Icons.star_border,
            size: 30,
            color: Colors.amber,
          ),
        ),
      );
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(0, 0),
                  zoom: 10,
                ),
                zoomControlsEnabled: false,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Your trip has ended',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'You made it',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/images/driver.png'),
                          Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.grey,
                            child: Row(
                              children: [
                                Text(
                                  '4.5',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Image.asset(
                        'assets/images/alto.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Leave Silas a review',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: renderStars(),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Write your review...',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF003D8E),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
