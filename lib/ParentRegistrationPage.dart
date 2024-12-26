import 'package:flutter/material.dart';
import 'ParentDashboardPage.dart';


class ParentRegistrationPage extends StatefulWidget {
  @override
  _ParentRegistrationPageState createState() => _ParentRegistrationPageState();
}

class _ParentRegistrationPageState extends State<ParentRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  int numberOfStudents = 1;
  List<Map<String, String>> students = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parent Registration'),
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
                decoration: InputDecoration(labelText: 'Number of Students'),
                keyboardType: TextInputType.number,
                onChanged: (value) => numberOfStudents = int.parse(value),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ParentDashboardPage(firstName: firstName)),
                        (route) => false,
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
