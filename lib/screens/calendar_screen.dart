import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem Vindo, ${FirebaseAuth.instance.currentUser!.email}!')),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _selectedDay,
            firstDay: DateTime.utc(2000),
            lastDay: DateTime.utc(2100),
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (sel, _) => setState(() => _selectedDay = sel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/tasks', arguments: _selectedDay),
            child: const Text('Selecionar o dia'),
          ),
        ],
      ),
    );
  }
}