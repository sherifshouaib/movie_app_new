import 'package:flutter/material.dart';
import 'package:movie_app_new/views/trailer_view.dart';

class WatchTrailerButton extends StatelessWidget {
  final int movieId;

  const WatchTrailerButton({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TrailerView(movieId: movieId)),
        );
      },
      icon: const Icon(Icons.play_arrow),
      label: const Text("Watch Trailer"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
