import 'package:flutter/material.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/Attendance/add_student.dart';

class ShowStudents extends StatefulWidget {
  @override
  _ShowStudentsState createState() => _ShowStudentsState();
}

class _ShowStudentsState extends State<ShowStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddStudent()));
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}
