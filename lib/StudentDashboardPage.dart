import 'main.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

Future<List<Map<String, String>>> loadCourses() async {
  try {
    final contents = await rootBundle.loadString('assets/json/student_courses.json');
    final List<dynamic> jsonData = jsonDecode(contents);
    return jsonData.map((course) {
      return {
        "name": course["name"]?.toString() ?? "Unknown",
        "description": course["description"]?.toString() ?? "No description available",
      };
    }).toList();
  } catch (e) {
    print("Error loading courses: $e");
    return []; // Return an empty list if an error occurs
  }
}

class StudentDashboardPage extends StatefulWidget {
  final String firstName;

  StudentDashboardPage({required this.firstName});

  @override
  _StudentDashboardPageState createState() => _StudentDashboardPageState();
}

class _StudentDashboardPageState extends State<StudentDashboardPage> {
  List<Map<String, String>> courses = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCourses().then((loadedCourses) {
      setState(() {
        courses = loadedCourses;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${widget.firstName}!'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : courses.isEmpty
          ? Center(child: Text("No courses available"))
          : ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            child: ListTile(
              title: Text(course["name"] ?? "Unknown Course"),
              subtitle: Text(course["description"] ?? "No description available"),
            ),
          );
        },
      ),
    );
  }
}