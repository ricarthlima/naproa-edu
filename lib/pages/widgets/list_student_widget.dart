import 'package:flutter/material.dart';
import 'package:flutter_ium_prototype/models/student_model.dart';
import 'package:flutter_ium_prototype/pages/student_avaliation_page.dart';

class ListStudentWidget extends StatelessWidget {
  final StudentModel model;
  final Function updateList;

  ListStudentWidget(this.model, this.updateList);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentAvaliationPage(model),
          ),
        ).then((sm) {
          if (sm != null) {
            this.updateList(sm);
          }
        });
      },
      child: Container(
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
                  Icons.person,
                  color: Colors.brown[700],
                  size: 48,
                ),
                Padding(padding: EdgeInsets.only(left: 16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.model.id!,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      this.model.name!,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    (model.todo!)
                        ? Text(
                            'PARECER PEDAGÓGICO PENDENTE',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            'PARECER PEDAGÓGICO ENTREGUE',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                )
              ],
            ),
            Icon(
              Icons.forward,
              color: Colors.brown,
              size: 64,
            ),
          ],
        ),
      ),
    );
  }
}
