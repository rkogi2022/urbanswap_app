import 'package:flutter/material.dart';

class AddPaypal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Feature
            GestureDetector(
              onTap: () {
                // Navigate back to AddPaymentMethod
              },
              child: Row(
                children: [
                  Text('< Back', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Paypal Account Heading
            Text('Paypal Account', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[900])),

            SizedBox(height: 20),

            // Email Label
            Text('Email', style: TextStyle(fontSize: 16, color: Colors.black)),

            SizedBox(height: 8),

            // Email Input
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'example@email.com',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Navigate to UrbanWallet
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Continue', style: TextStyle(fontSize: 16, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
