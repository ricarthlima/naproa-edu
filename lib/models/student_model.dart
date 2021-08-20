class StudentModel {
  String? id;
  String? name;
  bool? todo;
  String? textParecer;
  int? scoreGenerated;

  StudentModel(
      {this.id, this.name, this.todo, this.textParecer, this.scoreGenerated});

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    todo = json['todo'];
    textParecer = json['textParecer'];
    scoreGenerated = json['scoreGenerated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['todo'] = this.todo;
    data['textParecer'] = this.textParecer;
    data['scoreGenerated'] = this.scoreGenerated;
    return data;
  }
}
