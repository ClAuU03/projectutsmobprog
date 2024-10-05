import 'package:flutter/material.dart';
import 'package:projectuts2/screens/truefalse_final_screen.dart'; // Pastikan file ini sudah ada

class TrueFalseQuizScreen extends StatefulWidget {
  @override
  _TrueFalseQuizScreenState createState() => _TrueFalseQuizScreenState();
}

class _TrueFalseQuizScreenState extends State<TrueFalseQuizScreen> {
  // State untuk menyimpan status checkbox
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;

  // State untuk menyimpan nilai dropdown (durasi timer)
  String selectedTimer = '15'; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis Benar/Salah', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF00B1C2),
      ),
      // Mengatur agar layout dapat menyesuaikan saat keyboard muncul
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        // Membungkus Column dalam SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Soal Nomor 1
            Text("Soal 1"),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan soal',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked1,
                  activeColor: Color(0xFFFFD801),
                  onChanged: (value) {
                    setState(() {
                      isChecked1 = value!;
                      isChecked2 =
                          !value; // Pastikan hanya salah satu yang dipilih
                    });
                  },
                ),
                Text("Benar"),
                Checkbox(
                  value: isChecked2,
                  activeColor: Color(0xFFFFD801),
                  onChanged: (value) {
                    setState(() {
                      isChecked2 = value!;
                      isChecked1 =
                          !value; // Pastikan hanya salah satu yang dipilih
                    });
                  },
                ),
                Text("Salah"),
              ],
            ),
            SizedBox(height: 20),

            // Input Soal Nomor 2
            Text("Soal 2"),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan soal',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked3,
                  activeColor: Color(0xFFFFD801),
                  onChanged: (value) {
                    setState(() {
                      isChecked3 = value!;
                      isChecked4 =
                          !value; // Pastikan hanya salah satu yang dipilih
                    });
                  },
                ),
                Text("Benar"),
                Checkbox(
                  value: isChecked4,
                  activeColor: Color(0xFFFFD801),
                  onChanged: (value) {
                    setState(() {
                      isChecked4 = value!;
                      isChecked3 =
                          !value; // Pastikan hanya salah satu yang dipilih
                    });
                  },
                ),
                Text("Salah"),
              ],
            ),
            SizedBox(height: 20),

            // Input Soal Nomor 3
            Text("Soal 3"),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan soal',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked5,
                  activeColor: Color(0xFFFFD801),
                  onChanged: (value) {
                    setState(() {
                      isChecked5 = value!;
                      isChecked6 =
                          !value; // Pastikan hanya salah satu yang dipilih
                    });
                  },
                ),
                Text("Benar"),
                Checkbox(
                  value: isChecked6,
                  activeColor: Color(0xFFFFD801),
                  onChanged: (value) {
                    setState(() {
                      isChecked6 = value!;
                      isChecked5 =
                          !value; // Pastikan hanya salah satu yang dipilih
                    });
                  },
                ),
                Text("Salah"),
              ],
            ),
            SizedBox(height: 30),

            // Timer Section
            Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Color(0xFFFFD801),
                ),
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

            // Tombol "Buat Kuis"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman truefalse_final_screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TruefalseFinalScreen(), // Pindah ke halaman final
                    ),
                  );
                },
                child: Text("Buat Kuis", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Color(0xFF00B1C2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
