import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class TopUpWallet extends StatefulWidget {
  @override
  _TopUpWalletState createState() => _TopUpWalletState();
}

class _TopUpWalletState extends State<TopUpWallet> {
  final List<Map<String, String>> paymentMethods = [
    {'label': 'M-Pesa', 'icon': 'wallet'},
    {'label': 'Visa        .....1122', 'icon': 'card'},
    {'label': 'Mastercard      .....0439', 'icon': 'card'},
    {'label': 'Cash', 'icon': 'cash'},
  ];

  String selectedValue = 'M-Pesa';

  @override
  void initState() {
    super.initState();
    checkAndRedirect();
  }

  Future<void> checkAndRedirect() async {
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
              onTap: () => navigateTo('/urbanWallet'),
              child: Text('< Back', style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
            SizedBox(height: 20),
            Text('Top up wallet', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[900])),
            SizedBox(height: 10),
            Text('Add funds to your urban wallet to transact easily.', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter amount (between 5 and 100,000)',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text('Choose a payment method', style: TextStyle(fontSize: 20, color: Colors.blue[900])),
            SizedBox(height: 10),
            Column(
              children: paymentMethods.map((method) {
                return ListTile(
                  leading: Icon(getIconData(method['icon']!), color: Colors.blue[900]),
                  title: Text(method['label']!),
                  trailing: Radio<String>(
                    value: method['label']!,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navigateTo('/mpesaTopup'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Center(
                child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData getIconData(String iconName) {
    switch (iconName) {
      case 'wallet':
        return Ionicons.wallet;
      case 'card':
        return Ionicons.card;
      case 'cash':
        return Ionicons.cash;
      default:
        return Icons.help;
    }
  }
}
