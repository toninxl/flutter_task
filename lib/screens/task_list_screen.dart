import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';
import '../services/firebase_service.dart';
import '../widgets/task_tile.dart';
import 'add_task_dialog.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final day = ModalRoute.of(context)!.settings.arguments as DateTime;
    final service = FirebaseService();

    return Scaffold(
      appBar: AppBar(title: Text('Dia ${DateFormat('dd/MM/yyyy').format(day)}')),
      body: StreamBuilder<List<Task>>(
        stream: service.streamTasks(day),
        builder: (c, snap) {
          if (!snap.hasData) return const Center(child: CircularProgressIndicator());
          final tasks = snap.data!;
          tasks.sort((a, b) {
            if (a.completed != b.completed) {
              return a.completed ? 1 : -1;
            }
            return a.title.compareTo(b.title);
          });
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (_, i) => TaskTile(task: tasks[i], service: service),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddTaskDialog(day: day, service: service),
        ),
      ),
    );
  }
}