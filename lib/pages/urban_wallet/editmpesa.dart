import 'package:flutter/material.dart';

class EditMpesa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Feature
            GestureDetector(
              onTap: () {
                // Implement navigation to AddPaymentMethod
              },
              child: Row(
                children: [
                  Text('< Back', style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 40),
            // Mpesa Account Heading
            Text('Edit M-Pesa Number', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[900])),
            SizedBox(height: 16),
            // Heading
            Text('Enter phone number', style: TextStyle(fontSize: 16, color: Colors.black)),
            SizedBox(height: 8),
            // Phone Number Input
            Container(
              width: 357,
              height: 51,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFF1F1F1),
              ),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '0722 111 467',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Implement navigation to UrbanWallet
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF003D8E),
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Save', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Color(0xFFF1F1F1))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
