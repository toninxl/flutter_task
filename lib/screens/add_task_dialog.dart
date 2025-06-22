import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/firebase_service.dart';

class AddTaskDialog extends StatefulWidget {
  final DateTime day;
  final FirebaseService service;
  const AddTaskDialog({super.key, required this.day, required this.service});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _ctrl = TextEditingController();

  @override
  Widget build(BuildContext ctx) {
    return AlertDialog(
      title: Text('Adicionar Tarefa'),
      content: TextField(controller: _ctrl, decoration: InputDecoration(labelText: 'Descrição')),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Cancelar')),
        ElevatedButton(
          onPressed: () {
            widget.service.addTask(
              Task(id: '', title: _ctrl.text, date: widget.day),
            );
            Navigator.pop(ctx);
          },
          child: Text('Adicionar'),
        ),
      ],
    );
  }
}