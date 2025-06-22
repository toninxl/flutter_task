import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String title;
  bool completed;
  DateTime date;

  Task({
    required this.id,
    required this.title,
    this.completed = false,
    required this.date,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'completed': completed,
        'date': Timestamp.fromDate(date),
      };

  factory Task.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      title: data['title'],
      completed: data['completed'],
      date: (data['date'] as Timestamp).toDate(),
    );
  }
}