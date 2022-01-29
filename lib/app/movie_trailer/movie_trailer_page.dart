import 'package:flutter/material.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerPage extends StatefulWidget {
  final String youTubeKey;

  const MovieTrailerPage(
    this.youTubeKey, {
    Key? key,
  }) : super(key: key);

  @override
  State<MovieTrailerPage> createState() => _MovieTrailerPageState();
}

class _MovieTrailerPageState extends State<MovieTrailerPage> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.youTubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Trailer'),
          ),
          backgroundColor: ColorThemeShelf.backgroundDark,
          body: Center(child: player),
        );
      },
    );
  }
}
