import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseRidePage extends StatefulWidget {
  @override
  _ChooseRidePageState createState() => _ChooseRidePageState();
}

class _ChooseRidePageState extends State<ChooseRidePage> {
  String destination = "";
  String selectedPayment = "Cash";
  bool showDropdown = false;

  void chooseRide(String selectedDestination) {
    setState(() {
      destination = selectedDestination;
    });
  }

  void toggleDropdown() {
    setState(() {
      showDropdown = !showDropdown;
    });
  }

  void selectPayment(String paymentOption) {
    setState(() {
      selectedPayment = paymentOption;
      showDropdown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(0.0, 0.0),
                  zoom: 10,
                ),
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Choose a ride',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  buildRideOption('Basic', '3 minutes away', 'assets/images/basic_car.png', 450),
                  buildRideOption('Economy', '3 minutes away', 'assets/images/economy_car.png', 500),
                  buildRideOption('Urban Boda', '3 minutes away', 'assets/images/boda.png', 250),
                  buildRideOption('E-Comfort', '3 minutes away', 'assets/images/basic_car.png', 350),
                  SizedBox(height: 8),
                  buildPaymentCard(),
                  SizedBox(height: 20), // Added space to prevent overflow
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRideOption(String type, String time, String imagePath, int price) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Image.asset(imagePath, width: 70),
        title: Text(type),
        subtitle: Text(time),
        trailing: Text('KSH $price'),
        onTap: () => chooseRide(type),
      ),
    );
  }

  Widget buildPaymentCard() {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.payment, color: Colors.green),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: toggleDropdown,
                  child: Text(
                    selectedPayment,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Icon(showDropdown ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              ],
            ),
            if (showDropdown)
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      title: Text('Cash', style: TextStyle(fontSize: 14)),
                      onTap: () => selectPayment('Cash'),
                    ),
                    ListTile(
                      dense: true,
                      title: Text('Wallet', style: TextStyle(fontSize: 14)),
                      onTap: () => selectPayment('Wallet'),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF003D8E),
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Choose $destination',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
