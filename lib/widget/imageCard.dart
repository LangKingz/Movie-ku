import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ImageCard extends StatefulWidget {
  const ImageCard({super.key});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  List<Map<String, dynamic>> movies = [];
  final int Max = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final key = '';
    final Url = 'https://api.themoviedb.org/3/movie/popular?api_key=$key';

    try {
      final response = await http.get(Uri.parse(Url));
      if (response.statusCode == 200) {
        final List<dynamic> results = json.decode(response.body)['results'];
        setState(() {
          movies = results
              .take(Max)
              .map((movie) => movie as Map<String, dynamic>)
              .toList();
        });
      }
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final movie = movies[index];
        return newMethoditems(movie);
      },
      itemCount: movies.length,
    );
  }

  Stack newMethoditems(movie) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
            width: double.infinity,
            height: 500,
            fit: BoxFit.fitWidth,
          ),
        ),
        const Positioned(
          right: 10,
          top: 10,
          child: Icon(Icons.favorite, color: Colors.red),
        ),
        Positioned(
          bottom: 3,
          left: 1,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              movie['title'],
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
