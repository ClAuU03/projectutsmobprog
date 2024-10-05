import 'package:flutter/material.dart';
import 'dart:async';
import 'skor.dart';

class WPPilihanganda extends StatefulWidget {
  @override
  _PilihangandaState createState() => _PilihangandaState();
}

class _PilihangandaState extends State<WPPilihanganda> {
  int score = 0;
  int timeLeft = 20;
  Timer? timer;
  double nilai = 0;

  // jawaban yang benar untuk setiap soal
  final Map<int, String> correctAnswers = {
    1: 'B. <a>', // jawaban benar pertanyaan 1
    2: 'A. <style>', // bener untuk kedua
    3: 'C. .php', // bener untuk ketiga
  };

  // Keep track sedang pertanyaan keberapa
  int currentQuestion = 1;

  @override
  void initState() {
    super.initState();
    startTimer(); // Start timer waktu kuis mulai
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer
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

  // fungsi handle jawaban usert
  void handleAnswer(String selectedAnswer) {
    // Check if the selected answer is correct
    if (correctAnswers[currentQuestion] == selectedAnswer) {
      setState(() {
        score++; // kalau jawaban bener, skornya nambah 1
      });
    }

    // Update nilai based on the score
    setState(() {
      if (score == 1) {
        nilai = 33;
      } else if (score == 2) {
        nilai = 67;
      } else if (score == 3) {
        nilai = 100;
      }

      // lanjut ke pertanyaan berikutnya. kalau no pertanyaan masih kurang dari 3 akan nambah terus

      if (currentQuestion < 3) {
        currentQuestion++; // Go to the next question
      } else {
        // kalau sudah sampai pertanyaan ke3 navigasi ke ResultsPage
        _showResultPage();
        // Cancel timer dan buat sisa waktu jadi 0
        timer?.cancel();
        timeLeft = 0;
      }
    });
  }

  // Navigasi ke ResultsPage
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
          padding: EdgeInsets.all(20),
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
              SizedBox(height: 40),

              // Lightbulb imagess
              Image.asset(
                'images/lightbulb.png',
                height: 150,
              ),

              SizedBox(height: 20),

              // menampilkan pertanyaan saat ini
              if (currentQuestion == 1) ...[
                buildQuestion(
                  'Pertanyaan 1 dari 3',
                  'Apa tag HTML yang digunakan untuk membuat hyperlink?',
                  ['A. <link>', 'B. <a>', 'C. <href>', 'D. <url>'],
                ),
              ] else if (currentQuestion == 2) ...[
                buildQuestion(
                  'Pertanyaan 2 dari 3',
                  'Apa yang digunakan untuk menerapkan gaya CSS ke elemen HTML?',
                  ['A. <style>', 'B. <script>', 'C. <link>', 'D. <css>'],
                ),
              ] else if (currentQuestion == 3) ...[
                buildQuestion(
                  'Pertanyaan 3 dari 3',
                  'Apa ekstensi file yang digunakan untuk file PHP?',
                  [
                    'A. .html',
                    'B. .css',
                    'C. .php',
                    'D. .js',
                  ],
                ),
              ],
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // fungsi membangun pertanyaan dan button pilihan ganda
  Widget buildQuestion(
      String questionTitle, String questionText, List<String> answers) {
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
        // menampilkan button pilihan jawaban
        for (var answer in answers)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: buildAnswerButton(answer),
          ),
      ],
    );
  }

  // fungsi membuat button jawaban
  Widget buildAnswerButton(String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            handleAnswer(answer); // memeriksa jawaban
          },
          child: Text(
            answer,
            style: TextStyle(
              color: Color(0xFF0D47A1),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
