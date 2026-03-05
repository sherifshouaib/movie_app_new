

import 'package:flutter/material.dart';
import 'package:movie_app_new/features/home/data/models/result_model.dart';
import 'package:movie_app_new/core/utils/constants.dart';

class ImageMovieDetails extends StatelessWidget {
  const ImageMovieDetails({
    super.key,
    required this.resultModel,
  });

  final ResultModel resultModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Image.network(
        '${Constants.imagePath}${resultModel.backdropPath}',
        // width: double.infinity,
        // height: 800,  مش لازم تدي height,width  كده كده هوا واخد ال expandedHeight  اللي فوق  ب 300
        // واصلا احنا عاملين  BoxFit.fill
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
      ),
    );
  }
}
