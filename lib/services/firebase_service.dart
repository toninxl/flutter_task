import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Task>> streamTasks(DateTime day) {
    final start = DateTime(day.year, day.month, day.day);
    final end = start.add(Duration(days: 1));

    return _db
        .collection('tasks')
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('date', isLessThan: Timestamp.fromDate(end))
        .snapshots()
        .map((snap) {
      final tasks = snap.docs.map((doc) => Task.fromDoc(doc)).toList();
      tasks.sort((a, b) {
        if (a.completed == b.completed) {
          return a.title.toLowerCase().compareTo(b.title.toLowerCase());
        }
        return a.completed ? 1 : -1;
      });
      return tasks;
    });
  }

  Future<void> addTask(Task task) async {
    await _db.collection('tasks').add(task.toMap());
  }

  Future<void> updateTask(Task task) async {
    await _db.collection('tasks').doc(task.id).update({'completed': task.completed});
  }

  Future<void> deleteTask(String id) async {
    await _db.collection('tasks').doc(id).delete();
  }
}