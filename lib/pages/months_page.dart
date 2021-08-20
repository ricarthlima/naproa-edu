import 'package:flutter/material.dart';
import 'package:flutter_ium_prototype/pages/liststudents_page.dart';

class MonthsPage extends StatelessWidget {
  final String title;
  MonthsPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title + " - Caderneta"),
      ),
      body: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "2021",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Wrap(
                children: [
                  Month("Janeiro/2021", title),
                  Month("Fevereiro/2021", title),
                  Month("Março/2021", title),
                  Month("Abril/2021", title),
                  Month("Maio/2021", title),
                  Month("Junho/2021", title),
                  Month("Julho/2021", title),
                  Month("Agosto/2021", title),
                ],
              ),
            ],
          )),
    );
  }
}

class Month extends StatelessWidget {
  final String title;
  final String nameClassroom;
  Month(this.title, this.nameClassroom);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListStudentPage(nameClassroom, title),
          ),
        );
      },
      child: Container(
        width: 250,
        child: Text(
          this.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.brown, width: 2),
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
      ),
    );
  }
}
