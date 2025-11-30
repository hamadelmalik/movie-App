import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entity/trending_entity.dart';

class AvailableMovieCard extends StatelessWidget {
  final TrendingMovieEntity trendingMovieEntity;

  const AvailableMovieCard({super.key, required this.trendingMovieEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              trendingMovieEntity.posterPath!,
              width: 220,
              height: 351,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${trendingMovieEntity.rating}",
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.star, color: Colors.yellow, size: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
