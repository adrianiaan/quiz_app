// lib/quiz.dart

import 'package:flutter/material.dart';
import 'package:quiz_app/datas/question.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/quetions_screen.dart'; // Jika Anda mengganti nama file, sesuaikan import ini
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/profile.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';

  // Fungsi untuk beralih dari layar utama ke layar pertanyaan
  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  // Fungsi untuk beralih ke layar profil
  void _profileScreen() {
    setState(() {
      _activeScreen = 'profile-screen';
    });
  }

  // Fungsi untuk menyimpan jawaban dan beralih ke layar hasil jika selesai
  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'result-screen';
      });
    }
  }

  // Fungsi untuk memulai ulang kuis dari layar hasil
  void _restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'start-screen';
    });
  }

  // Fungsi untuk kembali dari layar profil ke layar utama
  void _kembaliKeHome() {
    setState(() {
      _activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    // Tentukan widget mana yang akan ditampilkan berdasarkan state _activeScreen
    Widget screenWidget = HomeScreen(_switchScreen, profile: _profileScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: _chooseAnswer,
      );
    }

    if (_activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswer: _selectedAnswers,
        onRestart: _restartQuiz,
      );
    }

    if (_activeScreen == 'profile-screen') {
      screenWidget = Profile(onKembali: _kembaliKeHome);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}