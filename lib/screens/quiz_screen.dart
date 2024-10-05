import 'package:flutter/material.dart';
import 'trueFalse_screen.dart';
import 'multiplechoice_screen.dart'; // Pastikan import file yang benar
import 'essay_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Variabel untuk menyimpan status pilihan yang aktif
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pilih Kategori Kuis",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF00B1C2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Tambahkan Column untuk Checkbox
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    title: Text("Web Programming"),
                    value: selectedCategory == "Web Programming",
                    activeColor: Color(0xFFFFD801),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = "Web Programming"; // Set pilihan
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text("Algorithm"),
                    value: selectedCategory == "Algorithm",
                    activeColor: Color(0xFFFFD801),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = "Algorithm"; // Set pilihan
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text("Database Systems"),
                    value: selectedCategory == "Database Systems",
                    activeColor: Color(0xFFFFD801),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = "Database Systems"; // Set pilihan
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text("Mobile Programming"),
                    value: selectedCategory == "Mobile Programming",
                    activeColor: Color(0xFFFFD801),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = "Mobile Programming"; // Set pilihan
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Tambahkan spasi di bawah checkbox
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF3B547A),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  title: Text(
                    "Pilihan Ganda",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.check_box, color: Color(0xFFFFD801)),
                  onTap: () {
                    // Navigasi ke halaman MultipleChoiceQuizScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultipleChoiceQuizScreen(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF3B547A),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  title: Text(
                    "Essay",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.check_box, color: Color(0xFFFFD801)),
                  onTap: () {
                    // Navigasi ke halaman EssayQuizScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EssayQuizScreen()),
                    );
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF3B547A),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  title: Text(
                    "Benar/Salah",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.check_circle, color: Color(0xFFFFD801)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrueFalseQuizScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
