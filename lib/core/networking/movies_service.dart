import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_new/features/home/data/models/result_model.dart';

class MoviesService {
  Future<List<ResultModel>> getTrendingMovies() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=3fc3f4d6af6cc3f54f61ef42fabd9e76',
        ),
      );

      Map<String, dynamic> jsondata = jsonDecode(response.body);

      List<dynamic> results = jsondata['results'];

      List<ResultModel> movieslist = [];

      for (var result in results) {
        ResultModel movieModel = ResultModel(
          backdropPath: result['backdrop_path'] ?? '',
          originalTitle: result['original_title'] ?? '',
          overview: result['overview'] ?? '',
          posterPath: result['poster_path'] ?? '',
          releaseDate: result['release_date'] ?? '',
          title: result['title'] ?? '',
          voteAverage: (result['vote_average'] as num).toDouble(),
          id: result['id'] ?? 0,
        );
        movieslist.add(movieModel);
      }
      return movieslist;
    } catch (e) {
      return [];
    }
  }

  Future<List<ResultModel>> getUpcomingMovies() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=3fc3f4d6af6cc3f54f61ef42fabd9e76',
        ),
      );

      Map<String, dynamic> jsondata = jsonDecode(response.body);

      List<dynamic> results = jsondata['results'];

      List<ResultModel> movieslist = [];

      for (var result in results) {
        ResultModel movieModel = ResultModel(
          backdropPath: result['backdrop_path'] ?? '',
          originalTitle: result['original_title'] ?? '',
          overview: result['overview'] ?? '',
          posterPath: result['poster_path'] ?? '',
          releaseDate: result['release_date'] ?? '',
          title: result['title'] ?? '',
          voteAverage: (result['vote_average'] as num).toDouble(),
          id: result['id'] ?? 0,
        );
        movieslist.add(movieModel);
      }
      debugPrint('Upcoming movies count: ${movieslist.length}');
      return movieslist;
    } catch (e) {
      debugPrint(e.toString());

      return [];
    }
  }

  Future<List<ResultModel>> getTopRatedMovies() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=3fc3f4d6af6cc3f54f61ef42fabd9e76',
        ),
      );

      Map<String, dynamic> jsondata = jsonDecode(response.body);

      List<dynamic> results = jsondata['results'];

      List<ResultModel> movieslist = [];

      for (var result in results) {
        ResultModel movieModel = ResultModel(
          backdropPath: result['backdrop_path'] ?? '',
          originalTitle: result['original_title'] ?? '',
          overview: result['overview'] ?? '',
          posterPath: result['poster_path'] ?? '',
          releaseDate: result['release_date'] ?? '',
          title: result['title'] ?? '',
          voteAverage: (result['vote_average'] as num).toDouble(),
          id: result['id'] ?? 0,
        );
        movieslist.add(movieModel);
      }
      return movieslist;
    } catch (e) {
      return [];
    }
  }
}
