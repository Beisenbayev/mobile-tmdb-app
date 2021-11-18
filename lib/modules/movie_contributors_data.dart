class Contributor {
  final int id;
  final String fullName;
  final String imageName;
  final int contributCount;

  Contributor({
    required this.id,
    required this.fullName,
    required this.imageName,
    required this.contributCount,
  });
}

class ContributorsCollection {
  static List<Contributor> contributors = [
    Contributor(
      id: 1,
      fullName: 'Anthony Hortin',
      imageName: 'assets/images/contributorImage.jpg',
      contributCount: 89,
    ),
    Contributor(
      id: 2,
      fullName: 'Anthony Hortin',
      imageName: 'assets/images/contributorImage.jpg',
      contributCount: 89,
    ),
    Contributor(
      id: 3,
      fullName: 'Anthony Hortin',
      imageName: 'assets/images/contributorImage.jpg',
      contributCount: 89,
    ),
    Contributor(
      id: 4,
      fullName: 'Anthony Hortin',
      imageName: 'assets/images/contributorImage.jpg',
      contributCount: 89,
    ),
    Contributor(
      id: 5,
      fullName: 'Anthony Hortin',
      imageName: 'assets/images/contributorImage.jpg',
      contributCount: 89,
    ),
  ];
}
