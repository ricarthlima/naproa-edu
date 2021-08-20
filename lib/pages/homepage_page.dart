import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ium_prototype/models/student_model.dart';
import 'package:flutter_ium_prototype/pages/widgets/list_home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    verifyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas turmas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          resetData();
        },
        child: Icon(Icons.refresh),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/1245715430091755526/rdcs1vj1_400x400.jpg",
                ),
              ),
              accountName: Text("Ricarth Lima"),
              accountEmail: Text("rrsl@cin.ufpe.br"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ListView(
          children: [
            ListHomeWidget("1B2021", "1º Ano B", 15),
            ListHomeWidget("2B2021", "2º Ano B", 22),
            ListHomeWidget("3B2021", "3º Ano B", 30),
            ListHomeWidget("4B2021", "4º Ano B", 13),
            ListHomeWidget("5B2021", "5º Ano B", 20),
            ListHomeWidget("6B2021", "6º Ano C", 18),
          ],
        ),
      ),
    );
  }

  verifyData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? str = prefs.getString("DATA");
    if (str == null) {
      resetData();
    }
  }

  resetData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<StudentModel> list = [];

    list.add(StudentModel(
        id: "1651651", name: "Abner da Silva Alvarenga", todo: true));
    list.add(StudentModel(
        id: "2133123", name: "Ademir Aparecido Ferreira", todo: true));
    list.add(
        StudentModel(id: "5425214", name: "Adriana Celi Amorim", todo: true));
    list.add(
        StudentModel(id: "1241424", name: "Ailton Elton Ramos", todo: true));
    list.add(StudentModel(
        id: "6257572", name: "Camila Batista Moreira Dias", todo: true));
    list.add(
        StudentModel(id: "2727525", name: "Cicera Da Silva Sauro", todo: true));
    list.add(StudentModel(
        id: "2342342", name: "Daneiel Patricio Azevedo de Moraes", todo: true));
    list.add(StudentModel(
        id: "6236235", name: "Fernanda Brito dos Santos", todo: true));
    list.add(
        StudentModel(id: "4124124", name: "Giovana Oslo Ultimato", todo: true));
    list.add(StudentModel(
        id: "2141243", name: "Jose Batista da Silva Sauro", todo: true));
    list.add(StudentModel(
        id: "4124124", name: "Karina Suspeita de Lima", todo: true));
    list.add(StudentModel(
        id: "5315135", name: "Lucas Tamarineiro Azedo", todo: true));
    list.add(StudentModel(
        id: "1241246", name: "Octaviano Perpetuo Amado Souza", todo: true));
    list.add(StudentModel(
        id: "1461426", name: "Rafaela Gaviana Esmaltada da Silva", todo: true));
    list.add(StudentModel(
        id: "1646534", name: "Scarlet do Prado Retumbante", todo: true));
    list.add(StudentModel(
        id: "4124124", name: "Silmara Samira de Souza Silva", todo: true));
    list.add(StudentModel(id: "1241224", name: "Tafarel Saikesua", todo: true));

    String str = "";

    list.forEach((element) {
      str += json.encode(element.toJson()) + "\n";
    });

    prefs.setString("DATA", str);
  }
}
