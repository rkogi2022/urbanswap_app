import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class UrbanWallet extends StatefulWidget {
  @override
  _UrbanWalletState createState() => _UrbanWalletState();
}

class _UrbanWalletState extends State<UrbanWallet> {
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
              onTap: () => navigateTo('/home'),
              child: Row(
                children: [
                  Text('< Back', style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Wallet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.blue[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Urban Wallet', style: TextStyle(color: Colors.white, fontSize: 16)),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text('Recent Transactions', style: TextStyle(color: Colors.white, fontSize: 16)),
                              Icon(Ionicons.chevron_forward_outline, size: 16, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('KSH 200.00', style: TextStyle(color: Colors.white, fontSize: 32)),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => navigateTo('/topUpWallet'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        minimumSize: Size(170, 40),
                      ),
                      icon: Icon(Ionicons.card_outline, size: 15),
                      label: Text('Top Up Wallet', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Payment Methods', style: TextStyle(color: Colors.blue[900], fontSize: 24)),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                paymentMethodItem('M-Pesa', Ionicons.phone_portrait_outline, () => navigateTo('/editMpesa')),
                paymentMethodItem('Visa .....1122', Ionicons.card_outline, () => navigateTo('/editCard')),
                paymentMethodItem('Mastercard .....0439', Ionicons.card_outline, () => navigateTo('/editCard')),
                paymentMethodItem('Cash', Ionicons.cash_outline, null),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navigateTo('/addPaymentMethod'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(170, 40),
              ),
              child: Text('+ Add Payment Method', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentMethodItem(String title, IconData icon, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 26),
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
