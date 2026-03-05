import 'package:flutter/material.dart';
import 'package:movie_app_new/features/home/data/models/result_model.dart';
import 'package:movie_app_new/core/networking/movies_service.dart';
import 'package:movie_app_new/features/home/presentation/views/widgets/trending_list_view.dart';

class TrendingListViewBuilder extends StatefulWidget {
  const TrendingListViewBuilder({super.key});

  @override
  State<TrendingListViewBuilder> createState() =>
      _TrendingListViewBuilderState();
}

class _TrendingListViewBuilderState extends State<TrendingListViewBuilder> {
  List<ResultModel> results = [];

  var future;

  @override
  void initState() {
    future = MoviesService().getTrendingMovies();
  }

  @override
  dispose() {
    //future = null;
     future.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ResultModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          results = snapshot.data!;
          return TrendingListView(results: results);
        } else if (snapshot.hasError) {
          return const ErrorMessage();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});
  //final String message;
  @override
  Widget build(BuildContext context) {
    return const Text('oops there was an error, try later');
  }
}
