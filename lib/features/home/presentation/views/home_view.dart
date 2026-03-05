import 'package:flutter/material.dart';
import 'package:movie_app_new/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            'assets/images/flutflix.png',
            height: 40,
          ),
          centerTitle: true,
        ),
        body: HomeViewBody(),
      ),
    );
  }
}

