import 'package:flutter/material.dart';
import 'package:movie_app_new/features/home/data/models/result_model.dart';

class OverviewPart extends StatelessWidget {
  const OverviewPart({
    super.key,
    required this.resultModel,
  });

  final ResultModel resultModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      resultModel.overview ?? ' ',
      style: const TextStyle(fontSize: 25, color: Colors.white),
    );
  }
}
