import 'package:flutter/material.dart';  // Import statement should be at the top
import 'dart:convert'; // Other imports if necessary
import 'package:path_provider/path_provider.dart';  // For path_provider if needed
import 'package:flutter/services.dart';
import 'main.dart';
import 'dart:io';

Future<Map<String, List<String>>> loadStudents() async {
  final contents = await rootBundle.loadString('assets/json/parent_students.json');
  return Map<String, List<String>>.from(
      jsonDecode(contents).map((key, value) => MapEntry(key, List<String>.from(value))));
}

class ParentDashboardPage extends StatelessWidget {
  final String firstName;

  ParentDashboardPage({required this.firstName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $firstName!'),
      ),
      body: Center(
        child: Text('Parent Dashboard'),
      ),
    );
  }
}
