import 'package:flutter/material.dart';

class MoviesRental extends StatelessWidget {
  const MoviesRental({super.key});

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              color: const Color.fromARGB(255, 37, 0, 53),
            ),
          )
        ],
      ),
    );
  }
}
//a