import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SignUpScreen()));
}

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Визначення теми в методі build
    final ThemeData theme = ThemeData(
      primaryColor: Colors.blue,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Синій колір для кнопки "Sign Up"
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Квадратні краї
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white, // Білий фон
          side: const BorderSide(color: Colors.black), // Чорна обводка
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Квадратні краї
          ),
        ),
      ),
    );

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: const OutlineInputBorder(),
                  labelStyle: theme.textTheme.labelMedium, // Стиль тексту етикетки
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  labelStyle: theme.textTheme.labelMedium, // Стиль тексту етикетки
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: const OutlineInputBorder(),
                  labelStyle: theme.textTheme.labelMedium, // Стиль тексту етикетки
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      confirmPasswordController.text.isEmpty) {
                    _showAlertDialog(context, 'Please fill in all fields.');
                  } else if (passwordController.text.length < 7) {
                    _showAlertDialog(context, 'Password must be at least 7 characters long.');
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
                    _showAlertDialog(context, 'Please enter a valid email address.');
                  } else if (passwordController.text != confirmPasswordController.text) {
                    _showAlertDialog(context, 'Passwords do not match.');
                  } else {
                    // Тут ви можете додати логіку для реєстрації користувача
                    _showAlertDialog(context, 'Registration successful!');
                  }
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Повернутися на екран входу
                },
                child: const Text('Already have an account? Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
