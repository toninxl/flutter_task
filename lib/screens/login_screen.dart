import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailCtrl.text,
        password: _passCtrl.text,
      );
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/calendar');
      }
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _emailCtrl, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passCtrl, decoration: InputDecoration(labelText: 'Senha'), obscureText: true),
            ElevatedButton(onPressed: _login, child: Text('Entrar')),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: Text('Cadastre‑se')),
          ],
        ),
      ),
    );
  }
}