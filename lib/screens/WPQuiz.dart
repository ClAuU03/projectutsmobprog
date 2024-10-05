import 'package:flutter/material.dart';
import 'package:projectuts2/screens/home_screen.dart';
import 'pgWP.dart';
import 'bsWP.dart';
import 'essayWP.dart';

class WPQuizHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xFF00B1C2), // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),

            // gambar start
            Image.asset(
              'images/starting.png',
              height: 150,
            ),
            SizedBox(height: 30),

            // text besar
            Text(
              "Sudah siap?",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            // Subtitle Text
            Text(
              "Pilih soal pilihan ganda atau soal benar salah atau soal esai!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),

            // Button pilgan
            SizedBox(
              width: double.infinity, // Make the button take full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WPPilihanganda()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3B547A), // Button background color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Soal Pilihan Ganda",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFFD801), // warna teks Button
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Button benar salah
            SizedBox(
              width: double.infinity, // Make the button take full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WPBenarsalah()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3B547A), // background button warna
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Soal Benar Salah",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFFD801), // warna teks button
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Button soal isian
            SizedBox(
              width: double.infinity, // button jadi lebar
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WPIsian()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3B547A), // background button warna
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Soal Isian",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFFD801), // warna teks button
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "HTML/CSS/PHP Quiz",
          style: TextStyle(color: Colors.white),
        ), // Judul halaman
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFFFD801)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        backgroundColor: Color(0xFF3B547A), // Warna AppBar
      ),
    );
  }
}
