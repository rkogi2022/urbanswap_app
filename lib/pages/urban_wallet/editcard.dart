import 'package:flutter/material.dart';


class EditCard extends StatelessWidget {
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
                // Navigate to AddPaymentMethod
              },
              child: Row(
                children: [
                  Text('< Back', style: TextStyle(fontFamily: 'Product Sans', fontSize: 16, color: Colors.black)),
                  SizedBox(width: 8),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Edit Card Heading
            Text('Edit Card', style: TextStyle(fontFamily: 'Product Sans', fontWeight: FontWeight.w700, fontSize: 24, color: Color(0xFF003D8E))),
            SizedBox(height: 24),

            // Card Number
            Text('Card Number', style: TextStyle(fontFamily: 'Product Sans', fontSize: 16, color: Color(0xFF999999))),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Color(0xFFE5E5E5)), borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Icon(Icons.wallet, size: 24, color: Color(0xFF999999)),
                  SizedBox(width: 8),
                  Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: '1111   1111   1111   1122'))),
                ],
              ),
            ),
            SizedBox(height: 16),
SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expiry Date', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      Container(
                        height: 51,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE5E5E5)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'MM/YY',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CVV', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      Container(
                        height: 51,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE5E5E5)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '123',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Country
            Text('Country', style: TextStyle(fontFamily: 'Product Sans', fontSize: 16, color: Color(0xFF999999))),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Color(0xFFE5E5E5)), borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Icon(Icons.flag, size: 24, color: Color(0xFF999999)),
                  SizedBox(width: 8),
                  Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'Kenya'))),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Nickname (optional)
            Text('Nickname (optional)', style: TextStyle(fontFamily: 'Product Sans', fontSize: 16, color: Color(0xFF999999))),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Color(0xFFE5E5E5)), borderRadius: BorderRadius.circular(8)),
              child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'e.g. work card or joint account')),
            ),
            SizedBox(height: 24),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Navigate to UrbanWallet
              },
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF003D8E), elevation: 3, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Save', style: TextStyle(fontFamily: 'Product Sans', fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.25, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
