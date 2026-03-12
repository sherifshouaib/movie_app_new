import 'package:flutter/material.dart';
import 'package:movie_app_new/core/networking/movies_service.dart';
import 'package:movie_app_new/features/home/presentation/views/widgets/movies_categories.dart';
import 'package:movie_app_new/features/home/presentation/views/widgets/trending_list_view_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Text(
              'Trending Movies',
              style: TextStyle(fontSize: 25, fontFamily: 'ABeeZee'),
            ),
          ),
          const TrendingListViewBuilder(),
          MoviesCategories(
            category: "Top rated movies",
            getdata: MoviesService().getTopRatedMovies(),
          ),
          MoviesCategories(
            category: "Upcoming movies",
            getdata: MoviesService().getUpcomingMovies(),
          ),
        ],
      ),
    );
  }
}
