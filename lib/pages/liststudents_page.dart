import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ium_prototype/models/student_model.dart';
import 'package:flutter_ium_prototype/pages/widgets/list_student_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListStudentPage extends StatefulWidget {
  final String title;
  final String date;
  ListStudentPage(this.title, this.date);

  @override
  _ListStudentPageState createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  List<StudentModel> listStudents = [];

  @override
  void initState() {
    refresh();
    super.initState();
  }

  refresh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? str = prefs.getString("DATA");
    List<String> map = [];

    if (str != null) {
      map = str.split("\n");
      map.removeLast();
      setState(() {
        map.forEach((element) {
          this.listStudents.add(StudentModel.fromJson(json.decode(element)));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.title + " - " + widget.date + " - Lista de Estudantes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          refresh();
        },
        child: Icon(Icons.refresh),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ListView(
          children: [
            for (StudentModel sm in listStudents)
              ListStudentWidget(sm, updateList)
          ],
        ),
      ),
    );
  }

  updateList(StudentModel sm) {
    setState(() {
      listStudents.forEach((element) {
        if (element.id == sm.id) {
          element = sm;
        }
      });
    });

    save();
  }

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String str = "";

    listStudents.forEach((element) {
      str += json.encode(element.toJson()) + "\n";
    });

    prefs.setString("DATA", str);
  }
}
