import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// -------------------
// شاشة التريلر
// -------------------
class TrailerView extends StatefulWidget {
  final int movieId;

  const TrailerView({super.key, required this.movieId});

  @override
  State<TrailerView> createState() => _TrailerViewState();
}

class _TrailerViewState extends State<TrailerView> {
  YoutubePlayerController? _controller;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchTrailer();
  }

  Future<void> fetchTrailer() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/${widget.movieId}/videos?api_key=3fc3f4d6af6cc3f54f61ef42fabd9e76');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'] as List;

        final trailer = results.firstWhere(
          (video) => video['site'] == 'YouTube' && video['type'] == 'Trailer',
          orElse: () => null,
        );

        if (trailer != null) {
          _controller = YoutubePlayerController(
            initialVideoId: trailer['key'],
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          );
        } else {
          errorMessage = "No trailer available";
        }
      } else {
        errorMessage = "Failed to load trailer";
      }
    } catch (e) {
      errorMessage = "Something went wrong";
    }

    setState(() {
      isLoading = false;
    });
  }



  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Trailer"),
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator() // Loading Indicator
              : errorMessage != null
                  ? Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.white),
                    )
                  : YoutubePlayer(
                      controller: _controller!,
                      showVideoProgressIndicator: true,
                    ),
        ),
      ),
    );
  }
}
