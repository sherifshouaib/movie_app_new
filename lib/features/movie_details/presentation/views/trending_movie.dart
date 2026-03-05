import 'package:flutter/material.dart';
import 'package:movie_app_new/features/home/data/models/result_model.dart';
import 'package:movie_app_new/core/buttons/back_btn.dart';
import 'package:movie_app_new/features/movie_details/presentation/views/widgets/bottom_part.dart';
import 'package:movie_app_new/features/movie_details/presentation/views/widgets/image_movie_details.dart';

class TrendingMovie extends StatelessWidget {
  const TrendingMovie({super.key, required this.resultModel});
  final ResultModel resultModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading:
                const BackBtn(), // leading:     ده المكون الاول لل  SliverAppBar.large ومساحته بتكون صغيرة واللي هي زرار الرجوع فقط
            backgroundColor: Colors.black,
            expandedHeight: 300,

            flexibleSpace: FlexibleSpaceBar(
              // ده المكون الثاني لل  SliverAppBar.large وهو يتكون من title: و  background:
              title: Text(
                resultModel.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: ImageMovieDetails(resultModel: resultModel),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 6, right: 4),
              child: BottomPart(resultModel: resultModel),
            ),
          ),
        ],
      ),
    );
  }
}
