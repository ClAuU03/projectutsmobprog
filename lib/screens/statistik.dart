import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Statistik extends StatefulWidget {
  final String subject;
  const Statistik({Key? key, required this.subject}) : super(key: key);

  @override
  State<Statistik> createState() => _Statistik();
}

class _Statistik extends State<Statistik> {
  // Initial data for 'Kuis 1'
  List<int> currentDistribusi = [
    0,
    3,
    2,
    5
  ]; // Initial distribution counts for Kuis 1
  List<String> quizNames = ['Kuis 1', 'Kuis 2', 'Kuis 3'];

  // Define the data for each quiz
  final Map<String, List<int>> quizData = {
    'Kuis 1': [
      0,
      3,
      2,
      5
    ], // Data for Kuis 1: 0 => 0, 33 => 3, 67 => 2, 100 => 5
    'Kuis 2': [
      0,
      0,
      5,
      5
    ], // Data for Kuis 2: 0 => 0, 33 => 0, 67 => 5, 100 => 5
    'Kuis 3': [
      2,
      1,
      1,
      6
    ], // Data for Kuis 3: 0 => 2, 33 => 1, 67 => 1, 100 => 6
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00B1C2),
        title: Text(
          'Statistik Nilai Kuis ${widget.subject}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 400, // Set the width
              height: 400, // Set the height
              child: BarChart(
                BarChartData(
                  //alignment: BarChartAlignment.spaceEvenly,
                  maxY: 6, // Maximum value for Y-axis
                  barGroups: _generateBarGroups(currentDistribusi),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text('0');
                            case 1:
                              return const Text('33');
                            case 2:
                              return const Text('67');
                            case 3:
                              return const Text('100');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Total Mahasiswa : 10",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quizNames.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Update the bar chart data when a quiz is selected
                    setState(() {
                      currentDistribusi = quizData[quizNames[index]]!;
                    });
                  },
                  child: _buildProductItem(quizNames[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Generate BarChartGroupData for the current distribution
  List<BarChartGroupData> _generateBarGroups(List<int> distribusi) {
    return List.generate(
      distribusi.length,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: distribusi[index].toDouble(),
            color: Color(0xFFFFD801),
            width: 20,
          ),
        ],
      ),
    );
  }

  // Function to build each quiz item
  Widget _buildProductItem(String name) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF3B547A), // Background color for the item
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
        ),
        padding: const EdgeInsets.all(16.0), // Add padding
        child: Row(
          children: [
            const SizedBox(width: 10),
            // Left column (quiz name)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ), // White text on blue background
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
