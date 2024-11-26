import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AddPaymentMethod extends StatefulWidget {
  @override
  _AddPaymentMethodState createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
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

  void navigateToAddCard() {
    // Implement navigation to AddCard
  }

  void navigateToAddMpesa() {
    // Implement navigation to AddMpesa
  }

  void navigateToAddPaypal() {
    // Implement navigation to AddPaypal
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
              onTap: () => Navigator.of(context).pop(),
              child: Row(
                children: [
                  Text('< Back', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Add payment method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Add funds to your urban wallet to transact easily.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                paymentMethodItem('Credit card', Ionicons.card_outline, navigateToAddCard),
                paymentMethodItem('M-Pesa', Ionicons.phone_portrait_outline, navigateToAddMpesa),
                paymentMethodItem('Paypal', Ionicons.logo_paypal, navigateToAddPaypal),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentMethodItem(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 20),
                SizedBox(width: 10),
                Text(title, style: TextStyle(fontSize: 16)),
              ],
            ),
            Icon(Ionicons.chevron_forward, size: 16),
          ],
        ),
      ),
    );
  }
}
