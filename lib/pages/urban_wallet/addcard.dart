import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AddCardScreen extends StatefulWidget {
  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  void initState() {
    super.initState();
    checkAndRedirect();
  }

  void checkAndRedirect() async {
    bool hasTokens = await checkTokens();
    if (!hasTokens) {
      // Navigate to LoginScreen
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<bool> checkTokens() async {
    // Implement the actual token check here
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Implement navigation to Add Payment Method
              },
              child: Row(
                children: [
                  Text('< Back', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text('Add Card', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[900])),
            SizedBox(height: 24),
            Text('Card Number', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Container(
              height: 51,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE5E5E5)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Ionicons.wallet, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '1111   1111   1111   1111',
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            SizedBox(height: 24),
            Text('Country', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Container(
              height: 51,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE5E5E5)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Ionicons.flag, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Kenya',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text('Nickname (optional)', style: TextStyle(fontSize: 16)),
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
                  hintText: 'e.g. work card or joint account',
                ),
              ),
            ),
            SizedBox(height: 180),
            ElevatedButton(
              onPressed: () {
                // Implement navigation to Urban Wallet
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue[900],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Save', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
