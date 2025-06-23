import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _isLoading = false;
  String? _errorMsg;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
      _errorMsg = null;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailCtrl.text,
        password: _passCtrl.text,
      );
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/calendar');
      }
    } catch (e) {
      setState(() => _errorMsg = 'Erro ao cadastrar. Verifique os dados e tente novamente.');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.person_add_outlined, size: 80, color: Color(0xFF6A1B9A)),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                decoration: BoxDecoration(
                  color: const Color(0xFF8E24AA),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email', style: TextStyle(color: Colors.white, fontSize: 16)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _emailCtrl,
                      decoration: const InputDecoration(hintText: 'seu@email.com'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    const Text('Senha', style: TextStyle(color: Colors.white, fontSize: 16)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _passCtrl,
                      decoration: const InputDecoration(hintText: '********'),
                      obscureText: true,
                    ),
                    if (_errorMsg != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        _errorMsg!,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                    const SizedBox(height: 40),
                    if (_isLoading)
                      const Center(child: CircularProgressIndicator(color: Colors.white))
                    else
                      ElevatedButton(
                        onPressed: _register,
                        child: const Text('Cadastrar'),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                child: const Text(
                  'Já tem conta? Faça login',
                  style: TextStyle(color: Color(0xFF6A1B9A)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
