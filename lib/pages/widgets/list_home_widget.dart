import 'package:flutter/material.dart';
import 'package:flutter_ium_prototype/pages/graph_page.dart';
import 'package:flutter_ium_prototype/pages/months_page.dart';

class ListHomeWidget extends StatelessWidget {
  final String id;
  final String title;
  final int countStudents;

  ListHomeWidget(this.id, this.title, this.countStudents);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown[700]!, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Icon(
                Icons.school,
                color: Colors.brown[700],
                size: 48,
              ),
              Padding(padding: EdgeInsets.only(left: 16)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.id,
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    this.title,
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    countStudents.toString() + ' estudantes',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GraphPage(title)));
                },
                child: Icon(
                  Icons.bar_chart,
                  color: Colors.green,
                  size: 64,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MonthsPage(title)));
                },
                child: Icon(
                  Icons.task,
                  color: Colors.blue,
                  size: 64,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
