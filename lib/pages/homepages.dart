import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:jobsheet4/widget/Listfilm.dart';
import 'package:jobsheet4/widget/detailpages.dart';
import 'package:jobsheet4/widget/imageCard.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    String name = 'Gilang';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: _salam(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            titelRecomen(),
            const SizedBox(height: 20),
            SizedBox(height: 500, child: ImageCard()),
            const SizedBox(height: 20),
            _titlePopular(context),
            const SizedBox(height: 20),
            SizedBox(height: 330, child: ListItemFilm()),
            MoslikeTitle(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar _salam() {
    return AppBar(
      title: Text(
        'Movies',
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print('Notification');
          },
          icon: const Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {
            print('Search');
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  Row MoslikeTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Most Liked Places',
          style: GoogleFonts.poppins(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Row titelRecomen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('recommendation for Today',
            style: GoogleFonts.poppins(
              fontSize: 20,
            )),
      ],
    );
  }

  Container ItemsPopular(image, name, rate) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 180,
              height: 250,
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
                child: Row(
              children: [
                const Icon(Icons.star,
                    color: Color.fromARGB(255, 233, 212, 26)),
                Text(
                  rate,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  IconButton(
                    onPressed: () {
                      print("Notification");
                    },
                    icon: const Icon(
                      Icons.navigate_next_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _headername(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Welcome , $name',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black38),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    print(name);
                  },
                  icon: const Icon(Icons.notifications)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          )
        ],
      ),
    );
  }

  Row _titlePopular(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular',
          style: GoogleFonts.poppins(
            fontSize: 20,
          ),
        ),
        GestureDetector(
          onTap: () => {},
          child: Text(
            'See all',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
