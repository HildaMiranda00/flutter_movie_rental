import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:signals/signals.dart';

class Movie {
  final int id;
  final String title;
  final List<int> cover;

  Movie({
    required this.id,
    required this.title,
    required this.cover,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Filme',
      cover: List<int>.from(json['cover'] ?? const []),
    );
  }
}

class UserController {
  final availableMovies = signal<List<Movie>>([]);

  Future<List<Movie>> getAvailableMovies() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.15.10:9354/available-movies'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        if (decoded is List) {
          final movies = decoded
              .map((item) => Movie.fromJson(item as Map<String, dynamic>))
              .toList();

          availableMovies.value = movies;
          return movies;
        }
      }

      availableMovies.value = [];
      return [];
    } catch (_) {
      availableMovies.value = [];
      return [];
    }
  }
}
//a