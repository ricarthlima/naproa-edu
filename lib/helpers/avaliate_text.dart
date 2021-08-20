class AvaliateText {
  String text;
  AvaliateText(this.text);

  int generateConcept() {
    text = text.toLowerCase();

    int negativePoints = 0;
    int positivePoints = 0;

    List<String> words = text.split(" ");

    for (int i = 0; i < words.length; i++) {
      if (goodWords.contains(words[i]) && words[max(0, i - 1)] != "não") {
        positivePoints += 1;
      }

      if (badWords.contains(words[i]) && words[max(0, i - 1)] != "não") {
        negativePoints += 1;
      }
    }

    return positivePoints - negativePoints;
  }

  int max(int a, int b) {
    if (a > b) {
      return a;
    } else {
      return b;
    }
  }

  static const List<String> badWords = [
    "dificuldades",
    "problemas",
    "confunde",
    "fraco",
    "insatisfatório",
    "insuficiente",
    "péssimo",
    "terrível",
    "incapaz"
  ];

  static const List<String> goodWords = [
    "compreende",
    "entende",
    "interpreta",
    "consegue",
    "boa",
    "compreender",
    "infere",
    "capacidade",
    "excelente",
    "ótima",
    "perfeita",
    "perfeito",
    "ótimo",
    "facilidade",
  ];
}
