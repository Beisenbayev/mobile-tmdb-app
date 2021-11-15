class Actor {
  final String fullName;
  final String character;
  int? episodeCount;

  Actor({
    required this.fullName,
    required this.character,
    this.episodeCount
  });
}

class ActorsCollection {
  static List<Actor> actors = [
    Actor(fullName: 'Hailee Steinfeld', character: 'Vi (voice)', episodeCount: 9),
    Actor(fullName: 'Hailee Steinfeld', character: 'Vi (voice)'),
    Actor(fullName: 'Hailee Steinfeld', character: 'Vi (voice)', episodeCount: 9),
    Actor(fullName: 'Hailee Steinfeld', character: 'Vi (voice)'),
    Actor(fullName: 'Hailee Steinfeld', character: 'Vi (voice)'),
    Actor(fullName: 'Hailee Steinfeld', character: 'Vi (voice)'),
    Actor(fullName: 'Hailee Steinfeld', character: 'Vi (voice)', episodeCount: 12),
    Actor(fullName: 'Hailee Steinfeld', character: 'Vi (voice)'),
  ];
}
