class Member {
  final String fullName;
  final String position;

  Member({
    required this.fullName,
    required this.position,
  });
}

class MembersCollection {
  static List<Member> members = [
    Member(fullName: 'Destin Daniel Cretton', position: 'Director, Screenplay'),
    Member(fullName: 'Jim Starlin', position: 'Screenplay'),
    Member(fullName: 'Steve Englehart', position: 'Screenplay'),
    Member(fullName: 'Dave Callaham', position: 'Screenplay'),
    Member(fullName: 'Andrew Lanham', position: 'Screenplay'),
  ];
}
