import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:yofopelis/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '66311435b5ddfea993a5c2cfdb55b4c4';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _page = 0;
  int _pageUpcoming = 0;

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> upcomingMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
    this.getUpcomingMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endPoint,
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    _page;

    final jsonData = await this._getJsonData(
      '3/movie/popular',
    );

    final popularResponse = PopularResponse.fromRawJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];

    print(popularMovies[0]);
    notifyListeners();
  }

  getUpcomingMovies() async {
    _pageUpcoming;
    final jsonData = await this._getJsonData('3/movie/upcoming');

    final upcomingResponse = UpcomingResponse.fromRawJson(jsonData);

    upcomingMovies = [...upcomingMovies, ...upcomingResponse.results];

    print("Upcoming ${upcomingMovies[0]}");
    notifyListeners();
  }
}
