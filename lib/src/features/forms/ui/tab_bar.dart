import 'package:flutter/material.dart';
import 'package:project_hadmc/src/features/forms/ui/available_movies.dart';
import 'package:project_hadmc/src/features/forms/ui/movies_rental.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Workshop_Flutter',
          style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 95, 8, 172),
          bottom: const TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 16),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: <Widget>[
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.grid_3x3, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Available movies",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.list, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Movies rental",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            AvailableMovies(),
            MoviesRental(),
          ],
        ),
      ),
    );
  }
}
//a