// lib/profile.dart
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.onKembali});

  final void Function() onKembali;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- PERUBAHAN DI BAGIAN INI ---
              const CircleAvatar(
                radius: 50,          
                backgroundImage: AssetImage(
                  'assets/images/foto_profil.jpeg', // Sesuaikan dengan nama file foto Anda
                ),
              ),
              // --- AKHIR PERUBAHAN ---
              const SizedBox(height: 20),
              const Text(
                'Adrian Akhmad Firdaus', // Ganti dengan nama Anda
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                '2210010491', // Ganti dengan NPM Anda
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              buildInfoCard(
                context,
                icon: Icons.email,
                label: 'Email',
                value: 'adrianakhmad03@gmail.com', // Ganti dengan email Anda
              ),
              const SizedBox(height: 15),
              buildInfoCard(
                context,
                icon: Icons.phone,
                label: 'Telepon',
                value: '+62 816 4916 6811', // Ganti dengan telepon Anda
              ),
              const SizedBox(height: 15),
              buildInfoCard(
                context,
                icon: Icons.school,
                label: 'Jurusan',
                value: 'Teknik Informatika', // Ganti dengan jurusan Anda
              ),
              const SizedBox(height: 15),
              buildInfoCard(
                context,
                icon: Icons.calendar_today,
                label: 'Tanggal Lahir',
                value: '14 Agustus 2003', // Ganti dengan tanggal lahir Anda
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: onKembali,
                child: const Text(
                  'Kembali',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(BuildContext context,
      {required IconData icon, required String label, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 7, 82, 123),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}