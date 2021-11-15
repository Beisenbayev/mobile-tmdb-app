class Movie {
  final int id;
  final String imageName;
  final String title;
  final String date;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.date,
    required this.description,
  });
}

class MoviesCollection {
  static List<Movie> movies = [
    Movie(
      id: 1,
      imageName: 'assets/images/image.jpg',
      title: 'Venom: Let There Be Carnage',
      date: 'September 30, 2021',
      description:
          'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
    ),
    Movie(
      id: 2,
      imageName: 'assets/images/image.jpg',
      title: 'Army of Thieves',
      date: 'September 30, 2021',
      description:
          'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
    ),
    Movie(
      id: 3,
      imageName: 'assets/images/image.jpg',
      title: 'Eternals',
      date: 'September 30, 2021',
      description:
          'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
    ),
    Movie(
      id: 4,
      imageName: 'assets/images/image.jpg',
      title: 'Dune',
      date: 'September 30, 2021',
      description:
          'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
    ),
    Movie(
      id: 5,
      imageName: 'assets/images/image.jpg',
      title: 'No Time to Die',
      date: 'September 30, 2021',
      description:
          'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
    ),
    Movie(
      id: 6,
      imageName: 'assets/images/image.jpg',
      title: 'Dune',
      date: 'September 30, 2021',
      description:
          'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
    ),
    Movie(
      id: 7,
      imageName: 'assets/images/image.jpg',
      title: 'Venom: Let There Be Carnage',
      date: 'September 30, 2021',
      description:
          'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
    ),
    Movie(
      id: 8,
      imageName: 'assets/images/image.jpg',
      title: 'No Time to Die',
      date: 'September 30, 2021',
      description:
          'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
    ),
    Movie(
      id: 9,
      imageName: 'assets/images/image.jpg',
      title: 'Venom: Let There Be Carnage',
      date: 'September 30, 2021',
      description:
          'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
    ),
  ];
}
