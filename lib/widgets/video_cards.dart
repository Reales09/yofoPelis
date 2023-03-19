import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yofopelis/models/models.dart';
import 'package:yofopelis/providers/movies_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoCards extends StatelessWidget {
  final int movieId;

  const VideoCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: moviesProvider.getVideosMovies(movieId),
      builder: (_, AsyncSnapshot<List<Video>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height: 180,
            child: const CupertinoActivityIndicator(),
          );
        }

        final List<Video> video = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 280,
          // color: Colors.red,
          child: ListView.builder(
            itemCount: video.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => _VideoCard(video[index]),
          ),
        );
      },
    );
  }
}

class _VideoCard extends StatelessWidget {
  final Video video;

  const _VideoCard(this.video);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: video.key,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 300,
          height: 270,
          // color: Colors.green,

          child: Column(
            children: [
              const SizedBox(height: 5),
              Text(
                video.type,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 5),
              Text(
                video.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
