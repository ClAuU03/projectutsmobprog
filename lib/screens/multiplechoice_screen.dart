import 'package:flutter/material.dart';
import 'truefalse_final_screen.dart';

class MultipleChoiceQuizScreen extends StatefulWidget {
  @override
  _MultipleChoiceQuizScreenState createState() =>
      _MultipleChoiceQuizScreenState();
}

class _MultipleChoiceQuizScreenState extends State<MultipleChoiceQuizScreen> {
  List<int> selectedAnswers = List<int>.filled(3, -1); // Menyimpan jawaban soal
  List<List<String>> options = List.generate(
      3, (_) => List.filled(4, '')); // Menyimpan opsi yang diisi dosen
  // State untuk menyimpan nilai dropdown (durasi timer)
  String selectedTimer = '15'; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kuis Pilihan Ganda',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF00B1C2),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Soal Nomor 1
              Text("Soal 1"),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan soal',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Opsi Soal 1 dengan TextField
              _buildOptionInput(0, 0),
              _buildOptionInput(0, 1),
              _buildOptionInput(0, 2),
              _buildOptionInput(0, 3),
              SizedBox(height: 30),

              // Soal Nomor 2
              Text("Soal 2"),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan soal',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Opsi Soal 2 dengan TextField
              _buildOptionInput(1, 0),
              _buildOptionInput(1, 1),
              _buildOptionInput(1, 2),
              _buildOptionInput(1, 3),
              SizedBox(height: 30),

              // Soal Nomor 3
              Text("Soal 3"),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan soal',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Opsi Soal 3 dengan TextField
              _buildOptionInput(2, 0),
              _buildOptionInput(2, 1),
              _buildOptionInput(2, 2),
              _buildOptionInput(2, 3),
              SizedBox(height: 30),

              // Icon Jam untuk Timer
              Row(
                children: [
                  Icon(Icons.timer, color: Color(0xFFFFD801)),
                  SizedBox(width: 10),
                  Text(
                    "Atur Timer:",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: selectedTimer,
                    items: [
                      DropdownMenuItem(
                        child: Text('15 Detik'),
                        value: '15',
                      ),
                      DropdownMenuItem(
                        child: Text('30 Detik'),
                        value: '30',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedTimer = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Tombol Buat Kuis
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Pindah ke halaman TrueFalseFinalScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TruefalseFinalScreen()),
                    );
                  },
                  child:
                      Text("Buat Kuis", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Color(0xFF00B1C2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk membuat opsi dengan TextField dan radio button
  Widget _buildOptionInput(int questionIndex, int optionIndex) {
    return Row(
      children: [
        // Radio button
        Radio<int>(
          value: optionIndex,
          groupValue: selectedAnswers[questionIndex],
          activeColor:
              Color(0xFFFFD801), // Ubah warna menjadi kuning saat dipilih
          onChanged: (value) {
            setState(() {
              selectedAnswers[questionIndex] = value!;
            });
          },
        ),
        // TextField untuk opsi
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Masukkan opsi jawaban',
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              setState(() {
                options[questionIndex][optionIndex] = text;
              });
            },
          ),
        ),
      ],
    );
  }
}
