// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class Homepage extends StatefulWidget {
//   @override
//   _HomepageState createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   late GoogleMapController mapController;
//   LocationData? currentLocation;
//   final Location location = Location();
//   final storage = FlutterSecureStorage();

//   static const LatLng _center = LatLng(37.42796133580664, -122.085749655962);
//   static const CameraPosition _initialCameraPosition = CameraPosition(
//     target: LatLng(37.773972, -122.431297),
//     zoom: 11.5,
//   );

//   @override
//   void initState() {
//     super.initState();
//     checkAndRedirect();
//     fetchLocation();
//   }

//   Future<void> checkAndRedirect() async {
//     String? token = await storage.read(key: 'auth_token');
//     if (token == null) {
//       Navigator.pushReplacementNamed(context, '/login');
//     }
//   }

//   Future<void> fetchLocation() async {
//     LocationData locationData = await location.getLocation();
//     setState(() {
//       currentLocation = locationData;
//     });
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   void navigateToRideLandingPage() {
//     Navigator.pushNamed(context, '/rideHailingLandingPage');
//   }

//   // Function to retrieve and print OTP from SharedPreferences
//   void _printOtp() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? otp = prefs.getString('otp');
//     print('OTP: $otp');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         children: [
//           Expanded(
//             flex: 7,
//             child: GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: _initialCameraPosition,
//               myLocationEnabled: true,
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                       onTap: navigateToRideLandingPage,
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Color(0xFFF1F1F1),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(Icons.search, size: 17),
//                             SizedBox(width: 10),
//                             Text(
//                               'Where to?',
//                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Previous Destinations',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     PreviousDestination(
//                       icon: Icons.access_time,
//                       title: 'The Mirage',
//                       address: 'Waiyaki Way, Westlands, Nairobi',
//                     ),
//                     PreviousDestination(
//                       icon: Icons.access_time,
//                       title: 'Two Rivers',
//                       address: 'Limuru Road, Ruaka',
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Ride Services',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         ServiceCard(
//                           image: 'assets/images/home_ride.png',
//                           label: 'Ride',
//                         ),
//                         ServiceCard(
//                           image: 'assets/images/home_package.png',
//                           label: 'Package',
//                         ),
//                         ServiceCard(
//                           image: 'assets/images/home_calender.png',
//                           label: 'Reserve',
//                         ),
//                         ServiceCard(
//                           image: 'assets/images/home_store.png',
//                           label: 'Store pickup',
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PreviousDestination extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String address;

//   const PreviousDestination({Key? key, required this.icon, required this.title, required this.address}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 5),
//       child: Row(
//         children: [
//           Icon(icon, size: 17),
//           SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//               Text(address),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ServiceCard extends StatelessWidget {
//   final String image;
//   final String label;

//   const ServiceCard({Key? key, required this.image, required this.label}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(5),
//       decoration: BoxDecoration(
//         color: Color(0xFFE4E4E4),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       width: 70,
//       height: 70,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(image, width: 50, height: 50),
//           SizedBox(height: 5),
//           Text(label, style: TextStyle(fontSize: 10)),
//         ],
//       ),
//     );
//   }
// }
