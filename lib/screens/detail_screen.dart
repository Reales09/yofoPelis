import 'package:flutter/material.dart';
import 'package:yofopelis/widgets/video_cards.dart';
import 'package:yofopelis/widgets/widgets.dart';

import '../models/models.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            movie: movie,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(
                // title: movie.title,
                // posterPath: movie.fullPosterImg,
                // voteAverage: movie.voteAverage,
                // originalTitle: movie.originalTitle,
                movie: movie,
              ),
              _Overview(overview: movie.overview),
              CastingCards(
                movieId: movie.id,
              ),
              VideoCards(movieId: movie.id)
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar({
    required this.movie,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 20, right: 10),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  // final String title;
  // final String originalTitle;
  // final double voteAverage;
  // final String posterPath;
  final Movie movie;

  const _PosterAndTitle({required this.movie});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              // Crea un widget de una card con estilo redondeado
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  'Lanzamiento ${movie.releaseDate}',
                  style: textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      movie.voteAverage.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final String overview;
  const _Overview({required this.overview});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          overview,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }
}
