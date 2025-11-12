import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final bool isPast;
  final VoidCallback onTap;

  const ExamCard({
    super.key,
    required this.exam,
    required this.isPast,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    final daysDiff = diff.inDays;
    final hoursDiff = diff.inHours % 24;

    // Define color logic
    Color? cardColor;
    if (isPast) {
      cardColor = Colors.grey[300];
    } else if (daysDiff <= 7 && daysDiff >= 0) {
      cardColor = Colors.orange[100];
    } else {
      cardColor = Colors.blue[100];
    }

    return Card(
      color: cardColor,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exam Name
              Text(
                exam.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Date row
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    "${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year}",
                  ),
                ],
              ),

              const SizedBox(height: 4),

              // Time row
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    "${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                  ),
                ],
              ),

              const SizedBox(height: 4),

              // Rooms + Soon! badge
              Row(
                children: [
                  const Icon(Icons.room, size: 16),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      exam.rooms.join(", "),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // "Soon!" or "In X days" badge
                  if (!isPast && daysDiff <= 7 && daysDiff >= 0)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        daysDiff == 0
                            ? "Today!"
                            : "In $daysDiff d${hoursDiff > 0 ? " $hoursDiff h" : ""}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
