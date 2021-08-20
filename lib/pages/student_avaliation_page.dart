import 'package:flutter/material.dart';
import 'package:flutter_ium_prototype/helpers/avaliate_text.dart';
import 'package:flutter_ium_prototype/models/student_model.dart';

class StudentAvaliationPage extends StatefulWidget {
  final StudentModel student;
  StudentAvaliationPage(this.student);
  @override
  _StudentAvaliationPageState createState() => _StudentAvaliationPageState();
}

class _StudentAvaliationPageState extends State<StudentAvaliationPage> {
  int page = 0;

  int score = 0;
  String concept = "";

  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    if (widget.student.textParecer != null) {
      _textController.text = widget.student.textParecer!;
      concept = " ";
    }

    if (widget.student.scoreGenerated != null) {
      score = widget.student.scoreGenerated!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student.name!),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Como você avalia o(a) " +
                      widget.student.name! +
                      " no conceito LEITURA?",
                  style: TextStyle(fontSize: 24),
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                TextField(
                  controller: _textController,
                  onChanged: (value) {
                    setState(() {
                      score = AvaliateText(value).generateConcept();
                      if (score != 0) {
                        concept = scoreToConcept(score);
                      }
                    });
                  },
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  maxLines: null,
                ),
                Visibility(
                  visible: concept != "",
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 8)),
                      Text(
                        "AVALIAÇÃO " + concept,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Avaliação sobre o estudante autogerada pelo sistema.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                ElevatedButton(
                    onPressed: () {
                      StudentModel sm = widget.student;
                      sm.textParecer = _textController.text;
                      sm.todo = false;
                      sm.scoreGenerated = score;
                      Navigator.pop(context, sm);
                    },
                    child: Text("Salvar")),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Divider(),
              ],
            )
          ],
        ),
      ),
    );
  }

  String scoreToConcept(int score) {
    if (score >= 2) {
      return "MUITO POSITIVA";
    }
    if (score == 1) {
      return "POSITIVA";
    }
    if (score == -1) {
      return "NEGATIVA";
    }
    if (score <= -2) {
      return "MUITO NEGATIVA";
    }
    return "MEDIANA";
  }
}
