import 'package:flutter/material.dart';
import 'package:movie_app_new/features/home/data/models/result_model.dart';
import 'package:movie_app_new/features/home/presentation/views/widgets/movies_list_view.dart';

class MoviesListViewBuilder extends StatefulWidget {
  const MoviesListViewBuilder({
    super.key,
    required this.getData,
  });

  final getData;
  @override
  State<MoviesListViewBuilder> createState() => _MoviesListViewBuilderState();
}

class _MoviesListViewBuilderState extends State<MoviesListViewBuilder> {
  List<ResultModel> results = [];

  var future;
  @override
  void initState() {
    future = widget.getData;
  }

  @override
  dispose() {
  //  future = null;
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
          return MoviesListView(
            results: results,
          );
        } else if (snapshot.hasError) {
          return const ErrorMessage();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
  });
  //final String message;
  @override
  Widget build(BuildContext context) {
    return const Text('oops there was an error, try later');
  }
}
