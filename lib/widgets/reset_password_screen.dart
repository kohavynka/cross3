import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: ResetPasswordScreen(),
    ),
  );
}

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Визначення теми в методі build
    final ThemeData theme = ThemeData(
      primaryColor: Colors.blue,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Синій колір для кнопки "Reset Password"
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
          title: const Text('Reset Password'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  border: const OutlineInputBorder(),
                  labelStyle: theme.textTheme.labelMedium, // Стиль тексту етикетки
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  if (email.isEmpty) {
                    _showAlertDialog(context, 'Please enter your email.');
                  } else if (!_isValidEmail(email)) {
                    _showAlertDialog(context, 'Please enter a valid email address.');
                  } else {
                    // Додайте логіку для скидання пароля тут
                    _showAlertDialog(context, 'Password reset link sent to $email');
                  }
                },
                child: const Text('Reset Password'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Повернутися на екран входу
                },
                child: const Text('Back to Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    // Проста регулярна вираз для перевірки формату email
    RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
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
