import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app_new/models/result_model.dart';
import 'package:movie_app_new/widgets/trending_card.dart';

class TrendingListView extends StatelessWidget {
   const TrendingListView({super.key,required this.results});

final List<ResultModel> results ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 300,
            child: CarouselSlider.builder(
              itemCount: results.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return TrendingCard(
                  resultModel: results[itemIndex],
                );
              },
              options: CarouselOptions(
                height: 300,
                //scrollDirection: Axis.horizontal,
                enlargeCenterPage: true,
                viewportFraction: 0.55,
                //pageSnapping: true,
                // autoPlayCurve: Curves.fastOutSlowIn
                autoPlayAnimationDuration: Duration(seconds: 1),
              ),
            ),
          );
    /*SizedBox(
    height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return TrendingCard();
        },
      ),
    );*/
  }
}

