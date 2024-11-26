import 'package:flutter/material.dart';
import 'legal_details_screen.dart';

class VehicleRegistrationScreen extends StatefulWidget {
  @override
  _VehicleRegistrationScreenState createState() => _VehicleRegistrationScreenState();
}

class _VehicleRegistrationScreenState extends State<VehicleRegistrationScreen> {
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _plateController = TextEditingController();
  final _colorController = TextEditingController();

  String? _selectedManufacturerType;
  final List<String> _manufacturerTypes = ['Toyota', 'Nissan', 'Passo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back, color: Colors.black),
                              SizedBox(width: 8),
                              Text('< Back', style: TextStyle(fontSize: 16, color: Colors.black)),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Your Vehicle Information',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Register your vehicle to get going.',
                                style: TextStyle(fontSize: 16, color: Color(0xFF8F8F8F)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildDropdownField('Manufacturer', _selectedManufacturerType, Icons.directions_car, 'Select a Manufacturer type', _manufacturerTypes),
                        SizedBox(height: 16),
                        _buildTextField('Model', _modelController, Icons.car_repair, 'Enter your Manufacturer Model'),
                        SizedBox(height: 16),
                        _buildTextField('Year', _yearController, Icons.calendar_today, 'Enter the Manufacturer Year', TextInputType.number),
                        SizedBox(height: 16),
                        _buildTextField('License Plate', _plateController, Icons.confirmation_number, 'Enter the License Plate'),
                        SizedBox(height: 16),
                        _buildTextField('Color', _colorController, Icons.color_lens, 'Enter the Manufacturer Color'),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[900],
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text(
                                'Back',
                                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LegalDetailsScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[700],
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text(
                                'Next',
                                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon, String hintText, [TextInputType inputType = TextInputType.text]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.black)),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
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
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String? selectedValue, IconData icon, String hintText, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.black)),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            hint: Text(hintText),
            isExpanded: true,
            icon: Icon(icon, color: Colors.grey[700]),
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue!;
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
      ],
    );
  }
}
