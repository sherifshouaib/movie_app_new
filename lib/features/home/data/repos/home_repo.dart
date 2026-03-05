import 'package:movie_app_new/core/errors/failure.dart';
import 'package:movie_app_new/features/home/data/models/result_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ResultModel>>> getTrendingMovies();
  Future<Either<Failure, List<ResultModel>>> getUpcomingMovies();
  Future<Either<Failure, List<ResultModel>>> getTopRatedMovies();
}
