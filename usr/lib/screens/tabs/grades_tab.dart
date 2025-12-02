import 'package:flutter/material.dart';
import '../../data/mock_data.dart';

class GradesTab extends StatelessWidget {
  const GradesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: MockData.recentGrades.length,
      itemBuilder: (context, index) {
        final grade = MockData.recentGrades[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _getGradeColor(grade.value),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      grade.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        grade.subject,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        grade.description,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${grade.date.day}.${grade.date.month}.',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Novák', // Meno učiteľa (mock)
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
