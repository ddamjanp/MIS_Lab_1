import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'exam_detail.dart';
import '../widgets/exam_card_widget.dart';

class ExamListScreen extends StatelessWidget {
  final String indexNumber;

  const ExamListScreen({super.key, required this.indexNumber});

  @override
  Widget build(BuildContext context) {

    final List<Exam> exams = [
      Exam(name: "Напредно Програмирање", dateTime: DateTime(2025, 11, 19, 9, 0), rooms: ["200A"]),
      Exam(name: "Менаџмент информациски системи", dateTime: DateTime(2025, 11, 10, 9, 0), rooms: ["200A"]),
      Exam(name: "Мобилни платформи и програмирање", dateTime: DateTime(2025, 11, 18, 14, 0), rooms: ["200В", "115"]),
      Exam(name: "Мобилни информациски системи", dateTime: DateTime(2025, 12, 24, 11, 0), rooms: ["115"]),
      Exam(name: "Бази на Податоци", dateTime: DateTime(2025, 12, 26, 10, 0), rooms: ["117"]),
      Exam(name: "Алгоритми и податочни структури", dateTime: DateTime(2025, 12, 28, 13, 0), rooms: ["116"]),
      Exam(name: "Компјутерски мрежи и Безбедност", dateTime: DateTime(2025, 12, 30, 9, 0), rooms: ["AMF MF"]),
      Exam(name: "Вовед во Наука за Податоците", dateTime: DateTime(2026, 1, 2, 15, 0), rooms: ["Финки АМФ - мал"]),
      Exam(name: "Вовед во Когнитивни Науки", dateTime: DateTime(2026, 1, 4, 12, 0), rooms: ["203"]),
      Exam(name: "ИКТ за развој", dateTime: DateTime(2026, 1, 6, 10, 0), rooms: ["215"]),
      Exam(name: "Претприемништво", dateTime: DateTime(2026, 1, 8, 14, 0), rooms: ["200Б"]),
    ];

    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text("Распоред за испити - $indexNumber"),
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          final isPast = exam.dateTime.isBefore(DateTime.now());

          return ExamCard(
            exam: exam,
            isPast: isPast,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExamDetailScreen(exam: exam),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.blueGrey[50],
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
