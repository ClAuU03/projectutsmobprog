import 'package:flutter/material.dart';
import 'truefalse_final_screen.dart';

class EssayQuizScreen extends StatefulWidget {
  @override
  _EssayQuizScreenState createState() => _EssayQuizScreenState();
}

class _EssayQuizScreenState extends State<EssayQuizScreen> {
  // State untuk menyimpan nilai dropdown (durasi timer)
  String selectedTimer = '15'; // Default value

  // Controllers untuk menyimpan teks yang diinputkan
  final TextEditingController question1Controller = TextEditingController();
  final TextEditingController answer1Controller = TextEditingController();

  final TextEditingController question2Controller = TextEditingController();
  final TextEditingController answer2Controller = TextEditingController();

  final TextEditingController question3Controller = TextEditingController();
  final TextEditingController answer3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kuis Esai',
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
                controller: question1Controller,
                decoration: InputDecoration(
                  hintText: 'Masukkan soal',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: answer1Controller,
                decoration: InputDecoration(
                  hintText: 'Masukkan jawaban',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),

              // Soal Nomor 2
              Text("Soal 2"),
              TextField(
                controller: question2Controller,
                decoration: InputDecoration(
                  hintText: 'Masukkan soal',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: answer2Controller,
                decoration: InputDecoration(
                  hintText: 'Masukkan jawaban',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),

              // Soal Nomor 3
              Text("Soal 3"),
              TextField(
                controller: question3Controller,
                decoration: InputDecoration(
                  hintText: 'Masukkan soal',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: answer3Controller,
                decoration: InputDecoration(
                  hintText: 'Masukkan jawaban',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),

              // Icon Jam untuk Timer
              Row(
                children: [
                  Icon(Icons.timer, color: Color(0xFFFFD801)),
                  SizedBox(width: 10),
                  Text(
                    "Atur Timer: ",
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
                  child: Text(
                    "Buat Kuis",
                    style: TextStyle(color: Colors.white),
                  ),
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
}
