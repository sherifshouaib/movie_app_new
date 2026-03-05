
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_new/core/errors/failure.dart';
import 'package:movie_app_new/features/home/data/models/result_model.dart';
import 'package:movie_app_new/core/networking/api_service.dart';
import 'package:movie_app_new/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ResultModel>>> getTrendingMovies() async {
    try {
      var data = await apiService.get1(
        endPoint:
            '3/trending/movie/day?language=en-US&api_key=3fc3f4d6af6cc3f54f61ef42fabd9e76',
      );

      Map<String, dynamic> jsondata = data;

      List<dynamic> results = jsondata['results'];

      List<ResultModel> movieslist = [];

      for (var result in results) {
        ResultModel movieModel = ResultModel(
          backdropPath: result['backdrop_path'],
          originalTitle: result['original_title'],
          overview: result['overview'],
          posterPath: result['poster_path'],
          releaseDate: result['release_date'],
          title: result['title'],
          voteAverage: result['vote_average'],
          id: result['id'],
        );
        movieslist.add(movieModel);
      }
      return right(movieslist);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ResultModel>>> getUpcomingMovies() async {
    try {
      var data = await apiService.get2(
        endPoint: '3/movie/upcoming?api_key=3fc3f4d6af6cc3f54f61ef42fabd9e76',
      );

      Map<String, dynamic> jsondata = data;

      List<dynamic> results = jsondata['results'];

      List<ResultModel> movieslist = [];

      for (var result in results) {
        ResultModel movieModel = ResultModel(
          backdropPath: result['backdrop_path'],
          originalTitle: result['original_title'],
          overview: result['overview'],
          posterPath: result['poster_path'],
          releaseDate: result['release_date'],
          title: result['title'],
          voteAverage: result['vote_average'],
          id: result['id'],
        );
        movieslist.add(movieModel);
      }
      return right(movieslist);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ResultModel>>> getTopRatedMovies() async {
    try {
      var data = await apiService.get3(
        endPoint: '3/movie/top_rated?api_key=3fc3f4d6af6cc3f54f61ef42fabd9e76',
      );

      Map<String, dynamic> jsondata = data;

      List<dynamic> results = jsondata['results'];

      List<ResultModel> movieslist = [];

      for (var result in results) {
        ResultModel movieModel = ResultModel(
          backdropPath: result['backdrop_path'],
          originalTitle: result['original_title'],
          overview: result['overview'],
          posterPath: result['poster_path'],
          releaseDate: result['release_date'],
          title: result['title'],
          voteAverage: result['vote_average'],
          id: result['id'],
        );
        movieslist.add(movieModel);
      }
      return right(movieslist);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
