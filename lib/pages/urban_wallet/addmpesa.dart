import 'package:flutter/material.dart';

class AddMpesa extends StatefulWidget {
  @override
  _AddMpesaState createState() => _AddMpesaState();
}

class _AddMpesaState extends State<AddMpesa> {
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

  void navigateTo(String route) {
    Navigator.pushNamed(context, route);
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
              onTap: () => navigateTo('/addPaymentMethod'),
              child: Row(
                children: [
                  Text('< Back', style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              'M-pesa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Enter phone number',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '0700 000 000',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => navigateTo('/urbanWallet'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
