import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _credentialController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  User? _loggedInUser;
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _errorMessage = null;
      _isLoading = true;
    });
    try {
      final user = await ApiService.login(
        _credentialController.text.trim(),
        _passwordController.text.trim(),
      );
      if (user != null) {
        setState(() {
          _loggedInUser = user;
        });
      } else {
        setState(() {
          _errorMessage = 'Неверный логин или пароль';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Ошибка сети или сервера';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<String> _testPing() async {
    return await fetchPing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вход')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final pingMessage = await _testPing();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ping: $pingMessage')),
                );
              },
              child: const Text('Проверить связь с сервером (ping)'),
            ),
            TextField(
              controller: _credentialController,
              decoration: const InputDecoration(
                labelText: 'Email или телефон',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Пароль',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            if (_loggedInUser != null)
              Text('Привет, ${_loggedInUser!.name}!'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: _isLoading ? const CircularProgressIndicator() : const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
