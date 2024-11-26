import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RideHailingLandingPage extends StatefulWidget {
  @override
  _RideHailingLandingPageState createState() => _RideHailingLandingPageState();
}

class _RideHailingLandingPageState extends State<RideHailingLandingPage> {
  String destination = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, MediaQuery.of(context).size.height * 0.05, 20.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Customize your trip',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Ionicons.location,
                  color: Colors.blue,
                ),
                hintText: 'PickUp',
                fillColor: Color(0xFFE4E4E4),
                filled: true,
              ),
              onChanged: (text) {
                setState(() {
                  destination = text;
                });
              },
            ),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Ionicons.arrow_forward,
                  color: Colors.blue,
                ),
                hintText: 'Destination',
                fillColor: Color(0xFFE4E4E4),
                filled: true,
              ),
              onChanged: (text) {
                setState(() {
                  destination = text;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'Saved Destinations',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            DestinationField(
              icon: Ionicons.home,
              title: 'Work',
              body: 'Kenyatta International Convention Center',
            ),
            DestinationField(
              icon: Ionicons.home,
              title: 'Home',
              body: '54 Kitusuru, Nairobi',
            ),
            DestinationField(
              icon: Ionicons.location,
              title: 'Village Market',
              body: 'Limuru Road, Nairobi',
            ),
            DestinationField(
              icon: Ionicons.location,
              title: 'Nairobi Hospital Doctor\'s Plaza',
              body: 'Argwings Kodhek Road, Nairobi',
            ),
            DestinationField(
              icon: Ionicons.location,
              title: 'Uganda House',
              body: 'Kenyatta Avenue, Nairobi',
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Stack(
                  children: [
                    Icon(
                      Icons.push_pin,
                      color: Colors.black,
                    ),
                    
                  ],
                ),
                SizedBox(width: 5),
                Text('Set location on map'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DestinationField extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const DestinationField({
    Key? key,
    required this.icon,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF838383), size: 17),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
              Text(body, style: TextStyle(fontSize: 14, color: Color(0xFF838383))),
            ],
          ),
        ],
      ),
    );
  }
}
