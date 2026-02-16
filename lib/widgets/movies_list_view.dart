import 'package:flutter/material.dart';
import 'package:movie_app_new/models/result_model.dart';
import 'package:movie_app_new/widgets/movies_card.dart';

class MoviesListView extends StatelessWidget {
   const MoviesListView({
    super.key,
    required this.results,
  });

  final List<ResultModel> results;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: results.length,
        itemBuilder: (context, index) {
          return MoviesCard(resultModel:results[index] ,);
        },
      ),
    );
  }
}



