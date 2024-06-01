import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:jobsheet4/widget/detailpages.dart';

class ListItemFilm extends StatefulWidget {
  const ListItemFilm({super.key});

  @override
  State<ListItemFilm> createState() => _ListItemFilmState();
}

class _ListItemFilmState extends State<ListItemFilm> {
  List<dynamic> listMovie = [];

  void initState() {
    super.initState();
    fetchData();
  }
  

  Future<void> fetchData() async {
    final apikey = '';
    final url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apikey';

    try {
      final response = await http.get(Uri.parse(url));
      listMovie = json.decode(response.body)['results'];
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listMovie.length,
      itemBuilder: (context, index) {
        final movie = listMovie[index];
        return GestureDetector(
            onTap: () => {
                  print('tap'),
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detailpages(
                                title: movie['title'],
                                overview: movie['overview'],
                                posterPath: movie['poster_path'],
                                rate: movie['vote_average'].toString(),
                              )))
                },
            child: items(movie));
      },
    );
  }

  Container items(movie) {
    return Container(
      width: 200,
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                width: 200,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              right: 10,
              top: 10,
              child: Icon(Icons.favorite, color: Colors.red),
            ),
          ]),
          const SizedBox(height: 20),
          Text(
            movie['title'],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
