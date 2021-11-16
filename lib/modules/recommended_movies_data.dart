class RecommendedMovie {
  final String title;
  final String imageName;
  final int userScore;

  RecommendedMovie({
    required this.title,
    required this.imageName,
    required this.userScore,
  });
}

class RecommendedMoviesCollection {
  static List<RecommendedMovie> recommendedMovies = [
    RecommendedMovie(title: 'Dune', imageName: 'assets/images/recommendationMovie.jpg', userScore: 78),
    RecommendedMovie(title: 'Dune', imageName: 'assets/images/recommendationMovie.jpg', userScore: 78),
    RecommendedMovie(title: 'Dune', imageName: 'assets/images/recommendationMovie.jpg', userScore: 78),
    RecommendedMovie(title: 'Dune', imageName: 'assets/images/recommendationMovie.jpg', userScore: 78),
    RecommendedMovie(title: 'Dune', imageName: 'assets/images/recommendationMovie.jpg', userScore: 78),
    RecommendedMovie(title: 'Dune', imageName: 'assets/images/recommendationMovie.jpg', userScore: 78),
  ];
}
