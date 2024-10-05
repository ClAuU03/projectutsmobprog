import 'package:flutter/material.dart';
import 'mahasiswa.dart'; // Pastikan untuk mengimpor model Player

class LeaderboardScreen extends StatelessWidget {
  final List<Mahasiswa> players = [
    Mahasiswa(name: "Rudi", score: 100),
    Mahasiswa(name: "Siti", score: 98),
    Mahasiswa(name: "Andi", score: 95),
    Mahasiswa(name: "Dewi", score: 95),
    Mahasiswa(name: "Budi", score: 78),
    Mahasiswa(name: "Fitri", score: 65),
    Mahasiswa(name: "Joko", score: 63),
    Mahasiswa(name: "Nina", score: 58),
    Mahasiswa(name: "Tono", score: 56),
    Mahasiswa(name: "Lina", score: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leaderboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF00B1C2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(players[index].name),
                trailing: Text(players[index].score.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
