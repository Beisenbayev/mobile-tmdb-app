class MovieFact {
  final String title;
  final String description;

  MovieFact({
    required this.title,
    required this.description,
  });
}

class MovieFactsCollections {
  static List<MovieFact> movieFacts = [
    MovieFact(title: 'Status', description: 'Released'),
    MovieFact(title: 'Original Language', description: 'English'),
    MovieFact(title: 'Budget', description: '150,000,000.00'),
    MovieFact(title: 'Revenue', description: '430,238,384.00'),
  ];
}
