import 'package:flutter/material.dart';

class Lesson {
  final String subject;
  final String time;
  final String room;
  final String teacher;
  final Color color;

  Lesson(this.subject, this.time, this.room, this.teacher, this.color);
}

class Grade {
  final String subject;
  final String value;
  final String description;
  final DateTime date;

  Grade(this.subject, this.value, this.description, this.date);
}

class Message {
  final String sender;
  final String subject;
  final String preview;
  final DateTime date;
  final bool isRead;

  Message(this.sender, this.subject, this.preview, this.date, this.isRead);
}

class MockData {
  static List<Lesson> todayLessons = [
    Lesson('Matematika', '08:00 - 08:45', 'Učebňa 101', 'Mgr. Novák', Colors.blue.shade100),
    Lesson('Slovenský jazyk', '08:55 - 09:40', 'Učebňa 204', 'PaedDr. Kováčová', Colors.red.shade100),
    Lesson('Anglický jazyk', '10:00 - 10:45', 'Jazyková učebňa', 'Mgr. Smith', Colors.orange.shade100),
    Lesson('Fyzika', '10:55 - 11:40', 'Laboratórium', 'RNDr. Malý', Colors.purple.shade100),
    Lesson('Telesná výchova', '11:50 - 12:35', 'Telocvičňa', 'Mgr. Rýchly', Colors.green.shade100),
  ];

  static List<Grade> recentGrades = [
    Grade('Matematika', '1', 'Písomka - Rovnice', DateTime.now().subtract(const Duration(days: 1))),
    Grade('Slovenský jazyk', '2', 'Diktát', DateTime.now().subtract(const Duration(days: 2))),
    Grade('Dejepis', '1', 'Odpoveď - 2. svetová vojna', DateTime.now().subtract(const Duration(days: 3))),
    Grade('Fyzika', '3', 'Laboratórne cvičenie', DateTime.now().subtract(const Duration(days: 5))),
  ];

  static List<Message> messages = [
    Message('Riaditeľstvo', 'Riaditeľské voľno', 'Vážení rodičia, oznamujeme Vám...', DateTime.now(), false),
    Message('Mgr. Novák', 'Domáca úloha', 'Nezabudnite na projekt z matematiky...', DateTime.now().subtract(const Duration(hours: 2)), true),
    Message('Jedáleň', 'Zmena jedálneho lístka', 'Z technických príčin bude v stredu...', DateTime.now().subtract(const Duration(days: 1)), true),
  ];
}
