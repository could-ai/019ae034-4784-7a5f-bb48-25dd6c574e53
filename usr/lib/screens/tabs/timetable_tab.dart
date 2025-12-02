import 'package:flutter/material.dart';
import '../../data/mock_data.dart';

class TimetableTab extends StatelessWidget {
  const TimetableTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: Colors.grey.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () {}),
              const Text(
                'Pondelok, 24. Február',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(icon: const Icon(Icons.arrow_forward_ios), onPressed: () {}),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: MockData.todayLessons.length,
            itemBuilder: (context, index) {
              final lesson = MockData.todayLessons[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        decoration: BoxDecoration(
                          color: lesson.color,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    lesson.subject,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    lesson.time,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.person_outline, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(lesson.teacher),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.room_outlined, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(lesson.room),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
