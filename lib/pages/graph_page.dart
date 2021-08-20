import 'package:flutter/material.dart';

class GraphPage extends StatefulWidget {
  final String title;
  GraphPage(this.title);

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Análise do " + widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            Text(
              "Habilidade: LEITURA",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Text("WORK IN PROGRESS"),
          ],
        ),
      ),
    );
  }
}
