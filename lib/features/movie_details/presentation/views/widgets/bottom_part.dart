import 'package:flutter/material.dart';
import 'package:movie_app_new/core/buttons/watch_trailer_button.dart';
import 'package:movie_app_new/features/home/data/models/result_model.dart';
import 'package:movie_app_new/features/movie_details/presentation/views/widgets/overview_part.dart';
import 'package:movie_app_new/features/movie_details/presentation/views/widgets/release_date_and_rating_row.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({super.key, required this.resultModel});

  final ResultModel resultModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WatchTrailerButton(movieId: resultModel.id),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'OVERVIEW',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        OverviewPart(resultModel: resultModel),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ReleaseDateAndRatingRow(resultModel: resultModel),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}

