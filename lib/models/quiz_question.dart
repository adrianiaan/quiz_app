import 'package:collection/collection.dart'; // Import ini penting untuk menggunakan .shuffle()

// Kelas QuizQuestion untuk merepresentasikan setiap pertanyaan kuis
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  // Metode untuk mengocok (shuffle) daftar jawaban
  // Metode ini yang diperlukan oleh 'question.dart' Anda
  List<String> getShuffledAnswers() {
    // Membuat salinan dari daftar jawaban asli agar tidak mengubah aslinya
    final shuffledList = List.of(answers);
    shuffledList.shuffle(); // Mengocok daftar
    return shuffledList;
  }
}
