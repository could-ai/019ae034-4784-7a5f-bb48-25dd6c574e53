import 'package:flutter/material.dart';
import '../../data/mock_data.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionTitle('Nasledujúca hodina'),
        _buildNextLessonCard(),
        const SizedBox(height: 20),
        _buildSectionTitle('Nové známky'),
        ...MockData.recentGrades.take(2).map((grade) => _buildGradeCard(grade)),
        const SizedBox(height: 20),
        _buildSectionTitle('Najnovšie správy'),
        ...MockData.messages.take(2).map((msg) => _buildMessageCard(msg)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildNextLessonCard() {
    final lesson = MockData.todayLessons.first;
    return Card(
      color: lesson.color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lesson.time,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(lesson.room),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              lesson.subject,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(lesson.teacher),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeCard(Grade grade) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getGradeColor(grade.value),
          child: Text(
            grade.value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(grade.subject),
        subtitle: Text(grade.description),
        trailing: Text(
          '${grade.date.day}.${grade.date.month}.',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildMessageCard(Message msg) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          msg.sender,
          style: TextStyle(fontWeight: msg.isRead ? FontWeight.normal : FontWeight.bold),
        ),
        subtitle: Text(
          msg.subject,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: msg.isRead
            ? null
            : const Icon(Icons.circle, color: Colors.blue, size: 12),
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case '1': return Colors.green;
      case '2': return Colors.lightGreen;
      case '3': return Colors.orange;
      case '4': return Colors.deepOrange;
      case '5': return Colors.red;
      default: return Colors.grey;
    }
  }
}
