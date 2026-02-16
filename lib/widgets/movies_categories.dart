import 'package:flutter/material.dart';
import 'package:movie_app_new/widgets/movies_list_view_builder.dart';

class MoviesCategories extends StatelessWidget {
  MoviesCategories({super.key, required this.category, required this.getdata});
  final getdata;
  String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          category,
          style: const TextStyle(fontSize: 25, fontFamily: 'ABeeZee'),
        ),
        const SizedBox(
          height: 30,
        ),
        MoviesListViewBuilder(
          getData: getdata,
        ),
      ],
    );
  }
}
