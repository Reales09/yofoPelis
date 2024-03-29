import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yofopelis/providers/movies_provider.dart';
import 'package:yofopelis/search/search_delegate.dart';
import 'package:yofopelis/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: const Icon(Icons.search_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Tarjeta pricipales
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              //Listado horizontal de peliculas
              // Slidedr de peliculas

              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
              MovieSlider(
                movies: moviesProvider.upcomingMovies,
                title: 'Proximos',
                onNextPage: () => moviesProvider.getUpcomingMovies(),
              ),
              MovieSlider(
                movies: moviesProvider.topRatedMovies,
                title: 'Top mejores calificados',
                onNextPage: () => moviesProvider.getTopRatedMovies(),
              ),
            ],
          ),
        ));
  }
}
