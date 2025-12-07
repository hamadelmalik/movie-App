import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entity/trending_entity.dart';

class AvailableMovieCard extends StatelessWidget {
  final TrendingMovieEntity trendingMovieEntity;

  const AvailableMovieCard({
    super.key,
    required this.trendingMovieEntity,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        'https://image.tmdb.org/t/p/w500${trendingMovieEntity.posterPath}';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 220,
              height: 351,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: 220,
                  height: 351,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 220,
                  height: 351,
                  color: Colors.grey[800],
                  child: const Icon(
                    Icons.broken_image,
                    color: Colors.white,
                    size: 50,
                  ),
                );
              },
            ),
          ),

          // ⭐ Rating
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    trendingMovieEntity.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.star, color: Colors.yellow, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
