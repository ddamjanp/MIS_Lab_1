import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String getTimeRemaining() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    if (difference.isNegative) {
      return "Испитот е поминат";
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;

    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Date
            Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 8),
                Text("${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year}"),
              ],
            ),
            const SizedBox(height: 10),
            // Time
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 8),
                Text("${exam.dateTime.hour.toString().padLeft(2,'0')}:${exam.dateTime.minute.toString().padLeft(2,'0')}"),
              ],
            ),
            const SizedBox(height: 10),
            // Rooms
            Row(
              children: [
                const Icon(Icons.room),
                const SizedBox(width: 8),
                Text(exam.rooms.join(", ")),
              ],
            ),
            const SizedBox(height: 24),
            // Time remaining
            Row(
              children: [
                const Icon(Icons.timer),
                const SizedBox(width: 8),
                Text(
                  "Прeостанато време: ${getTimeRemaining()}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
