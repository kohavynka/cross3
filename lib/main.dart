import 'package:flutter/material.dart';
import './widgets/sign_in_screen.dart';
import './widgets/signup_screen.dart';
import './widgets/reset_password_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Pages',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/reset_password': (context) => ResetPasswordScreen(),
      },
    );
  }
}
