import 'package:flutter/material.dart';
import 'StudentRegistrationPage.dart';
import 'ParentRegistrationPage.dart';
import 'StudentDashboardPage.dart';
import 'ParentDashboardPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentRegistrationPage()),
                );
              },
              child: Text('Signup as Student'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ParentRegistrationPage()),
                );
              },
              child: Text('Signup as Parent'),
            ),
          ],
        ),
      ),
    );
  }
}
