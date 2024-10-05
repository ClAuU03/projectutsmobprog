import 'package:flutter/material.dart';
import 'dart:async';
import 'skor.dart';

class Isian extends StatefulWidget {
  @override
  _IsianState createState() => _IsianState();
}

class _IsianState extends State<Isian> {
  int score = 0;
  int timeLeft = 20;
  Timer? timer;
  double nilai = 0;

  // jawaban yang benar untuk setiap soal
  final Map<int, String> correctAnswers = {
    1: 'Dart', // jawaban benar pertanyaan 1
    2: 'Text', // jawaban benar untuk kedua
    3: 'Flutter SDK', // jawaban benar untuk ketiga
  };

  // Keep track sedang pertanyaan keberapa
  int currentQuestion = 1;

  // Text controller untuk mengambil input dari user
  final TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer(); // Start timer saat kuis mulai
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer saat widget dihancurkan
    answerController.dispose(); // Hapus controller saat widget dihancurkan
    super.dispose();
  }

  // Start countdown timer
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        _showResultPage(); // navigasi ke halaman hasil setelah waktu habis
      }
    });
  }

  // fungsi untuk memeriksa jawaban user
  void handleAnswer() {
    String userAnswer = answerController.text
        .trim()
        .toLowerCase(); // Ambil jawaban dari text box dan trim

    if (correctAnswers[currentQuestion]?.toLowerCase() == userAnswer) {
      setState(() {
        score++; // Skor bertambah jika jawaban benar
      });
    }

    // Update nilai berdasarkan skor
    setState(() {
      if (score == 1) {
        nilai = 33;
      } else if (score == 2) {
        nilai = 67;
      } else if (score == 3) {
        nilai = 100;
      }

      // Lanjut ke pertanyaan berikutnya
      if (currentQuestion < 3) {
        currentQuestion++; // Pergi ke pertanyaan berikutnya
        answerController.clear(); // Kosongkan text box
      } else {
        // Kalau sudah sampai pertanyaan terakhir, navigasi ke halaman hasil
        _showResultPage();
        timer?.cancel();
        timeLeft = 0;
      }
    });
  }

  // Navigasi ke halaman hasil
  void _showResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          currentScore: nilai, // Pass skor ke ResultsPage
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          color: Color(0xFF3B547A), // warna background
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              // Display the timer
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(12),
                child: Text(
                  '$timeLeft',
                  style: TextStyle(
                    color: Color(0xFF0D47A1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50),

              // Lightbulb images
              Image.asset(
                'images/lightbulb.png',
                height: 150,
              ),

              SizedBox(height: 20),

              // Tampilkan pertanyaan berdasarkan nomor
              if (currentQuestion == 1) ...[
                buildQuestion(
                  'Pertanyaan 1 dari 3',
                  'Apa bahasa pemrograman yang digunakan untuk Flutter?',
                ),
              ] else if (currentQuestion == 2) ...[
                buildQuestion(
                  'Pertanyaan 2 dari 3',
                  'Apa widget yang digunakan untuk menampilkan teks?',
                ),
              ] else if (currentQuestion == 3) ...[
                buildQuestion(
                  'Pertanyaan 3 dari 3',
                  'Apa nama alat untuk mengembangkan aplikasi Flutter?',
                ),
              ],
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }

  // fungsi membangun pertanyaan dan text box untuk jawaban
  Widget buildQuestion(String questionTitle, String questionText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                questionText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // Text box untuk jawaban
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: answerController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan jawaban',
              fillColor: Colors.white,
              filled: true,
            ),
            onSubmitted: (value) {
              handleAnswer(); // Memeriksa jawaban saat dikirim
            },
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0), // Menambah padding kiri dan kanan
          child: ElevatedButton(
            onPressed: () {
              handleAnswer(); // Memeriksa jawaban saat tombol tekan
            },
            child: Text('Kirim Jawaban'),
          ),
        ),
      ],
    );
  }
}
