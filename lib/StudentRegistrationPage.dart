import 'package:flutter/material.dart';
import 'StudentDashboardPage.dart';

class StudentRegistrationPage extends StatefulWidget {
  @override
  _StudentRegistrationPageState createState() => _StudentRegistrationPageState();
}

class _StudentRegistrationPageState extends State<StudentRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String courses = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                onChanged: (value) => firstName = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                onChanged: (value) => lastName = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) => password = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Courses'),
                onChanged: (value) => courses = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDashboardPage(firstName: firstName),
                    ),
                  );
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
