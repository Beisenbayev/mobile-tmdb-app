class Discussion {
  final String title;
  final String imageName;
  final String username;
  final String date;
  final String type;
  final int repliesCount;

  Discussion({
    required this.title,
    required this.imageName,
    required this.username,
    required this.date,
    required this.type,
    required this.repliesCount,
  });
}

class DiscussionsCollection {
  static List<Discussion> discussions = [
    Discussion(
      title:
          'Share your initial thoughts about No Time To Die *HEAVY SPOILER DISCUSSION*',
      imageName: 'assets/images/discusserImage.jpg',
      username: 'mechajutaro',
      date: 'Nov 15, 2021 at 10:25 PM',
      type: 'open',
      repliesCount: 12,
    ),
    Discussion(
      title: 'This Bond (also) kind of sucks',
      imageName: 'assets/images/discusserImage.jpg',
      username: 'mechajutaro',
      date: 'Nov 15, 2021 at 10:25 PM',
      type: 'open',
      repliesCount: 32,
    ),
    Discussion(
      title:
          'Share your initial thoughts about No Time To Die *HEAVY SPOILER DISCUSSION*',
      imageName: 'assets/images/discusserImage.jpg',
      username: 'mechajutaro',
      date: 'Nov 15, 2021 at 10:25 PM',
      type: 'open',
      repliesCount: 0,
    ),
  ];
}
