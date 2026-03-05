import 'package:flutter/material.dart';
import 'package:movie_app_new/features/home/data/models/result_model.dart';
import 'package:movie_app_new/features/movie_details/presentation/views/trending_movie.dart';
import 'package:movie_app_new/core/utils/constants.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard({
    super.key,
    required this.resultModel,
  });

  final ResultModel resultModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TrendingMovie(
                  resultModel: resultModel,
                );
              },
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            '${Constants.imagePath}${resultModel.posterPath}',
            //color: Colors.amber,
            height: 200,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
