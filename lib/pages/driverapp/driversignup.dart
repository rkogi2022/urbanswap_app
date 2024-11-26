import 'package:flutter/material.dart';
import 'vehicle_registration_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _secondnameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

  String? _selectedVehicleType;

  final List<String> _vehicleTypes = [
    'Car',
    'Boda',
    'Ambulance',
    'Fire-Extinguisher'
  ];

  bool _hasVehicle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Personal Information',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              'Only your first name and vehicle details are visible to clients during the booking.',
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            _buildTextField(
                'First Name', _firstnameController, Icons.person, 'Bria'),
            SizedBox(height: 16),
            _buildTextField(
                'Last Name', _secondnameController, Icons.person, 'Doe'),
            SizedBox(height: 16),
            _buildTextField('Email', _emailController, Icons.email,
                'example@gmail.com', TextInputType.emailAddress),
            SizedBox(height: 16),
            _buildTextField(
                'Referral Code', _referralCodeController, Icons.code, 'A3V4II'),
            SizedBox(height: 16),
            _buildDropdownField('What type of vehicle will you be driving?',
                _selectedVehicleType, _vehicleTypes),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _hasVehicle,
                  onChanged: (newValue) {
                    setState(() {
                      _hasVehicle = newValue!;
                    });
                  },
                ),
                Text('I have a vehicle that I will drive.'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _continueToVehicleRegistration,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF003D8E),
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      IconData icon, String hintText,
      [TextInputType inputType = TextInputType.text]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.black)),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF003D8E), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              icon: Icon(icon, color: Colors.grey[700]),
              border: InputBorder.none,
              hintText: hintText,
            ),
            keyboardType: inputType,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String? value, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.black)),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF003D8E), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: Text('Select'),
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  value = newValue!;
                });
              },
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  void _continueToVehicleRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VehicleRegistrationScreen()),
    );
  }
}
