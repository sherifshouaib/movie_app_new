import 'package:flutter/material.dart';
import 'package:movie_app_new/buttons/watch_trailer_button.dart';
import 'package:movie_app_new/models/result_model.dart';
import 'package:movie_app_new/widgets/back_btn.dart';
import 'package:movie_app_new/widgets/constants.dart';

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
            //pinned: true,
            //floating: true,
            flexibleSpace: FlexibleSpaceBar(
              // ده المكون الثاني لل  SliverAppBar.large وهو يتكون من title: و  background:
              title: Text(
                resultModel.title,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              background: ClipRRect(
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
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 6, right: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WatchTrailerButton(movieId: resultModel.id),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'OVERVIEW',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    resultModel.overview,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 33,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Release date: ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  resultModel.releaseDate,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Rating: ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '${resultModel.voteAverage.toStringAsFixed(1)}/10',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
