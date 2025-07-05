// lib/home_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  // Tambahkan parameter 'profile' di konstruktor
  const HomeScreen(this.startQuiz, {super.key, required this.profile});

  final void Function() startQuiz;
  final void Function() profile; // Deklarasikan fungsi untuk profil

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            // Menambahkan transparansi pada gambar
          ),
          const SizedBox(height: 20),
          Text(
            'Quiz APP',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 34,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Praktikum Mobile 6A Reguler Pagi',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Mulai Quiz'),
          ),
          const SizedBox(height: 10), // Tambahkan spasi
          // Tombol untuk ke halaman profil
          TextButton(
            onPressed: profile, // Panggil fungsi navigasi profil
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.people_alt, color: Colors.white),
                SizedBox(width: 8),
                Text('Profile', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}