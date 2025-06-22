import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/firebase_service.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final FirebaseService service;
  const TaskTile({super.key, required this.task, required this.service});

  @override
  Widget build(BuildContext c) {
    return ListTile(
      title: Text(task.title, style: TextStyle(decoration: task.completed ? TextDecoration.lineThrough : null)),
      leading: Checkbox(
        value: task.completed,
        onChanged: (_) => service.updateTask(Task(
          id: task.id,
          title: task.title,
          completed: !task.completed,
          date: task.date,
        )),
      ),
      trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => service.deleteTask(task.id)),
    );
  }
}