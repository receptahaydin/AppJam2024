import 'package:app_jam_2024/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class MissingPlace extends StatefulWidget {
  const MissingPlace({Key? key}) : super(key: key);

  @override
  State<MissingPlace> createState() => _MissingPlaceState();
}

class _MissingPlaceState extends State<MissingPlace> {
  final TextEditingController _textField1Controller = TextEditingController();
  final TextEditingController _textField2Controller = TextEditingController();

  String? _selectedCity;

  final List<String> _cities = [
    'İstanbul',
    'Ankara',
    'İzmir',
    'Adana',
    'Gaziantep',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b2831),
      appBar: AppBar(
        title: Text('Missing Place'),
        backgroundColor: Color(0xFF2b2831),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            reusableTextField(
              'Yer Adı',
              Icons.email,
              false,
              _textField1Controller,
            ),
            SizedBox(height: 20),
            reusableTextField(
              'Bulunduğu Şehir',
              Icons.lock,
              true,
              _textField2Controller,
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Şehir',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // Border rengini beyaz yapar
                ),
              ),
              value: _selectedCity,
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                });
              },
              items: _cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Fotoğraf ekleme işlemleri burada gerçekleştirilecek
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFBF244d), // Buton rengini turuncu yapar
              ),
              child: Text(
                'Fotoğraf Ekle',
                style: TextStyle(
                  color: Colors.white, // Metin rengini beyaz yapar
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
