class Keyword {
  final int id;
  final String title;

  Keyword({
    required this.id,
    required this.title,
  });
}

class KeywordsCollection {
  static List<Keyword> keywords = [
    Keyword(id: 1, title: 'martial arts'),
    Keyword(id: 2, title: 'superhero'),
    Keyword(id: 3, title: 'marvel cinematic universe (mcu)'),
    Keyword(id: 4, title: 'based on comic'),
    Keyword(id: 5, title: 'mixed martial arts'),
    Keyword(id: 6, title: 'martial arts'),
  ];
}