import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entity/action_entity.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';

class ActionMoviesCard extends StatelessWidget {
  final MovieEntity movieEntity;

  const ActionMoviesCard({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        'https://image.tmdb.org/t/p/w500${movieEntity.posterPath}';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: movieEntity.posterPath.isNotEmpty
                ? Image.network(
                    imageUrl,
                    width: 140,
                    height: 210,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _errorImage(),
                  )
                : _errorImage(),
          ),
          Positioned(top: 8, right: 8, child: _ratingBadge()),
        ],
      ),
    );
  }

  Widget _errorImage() {
    return Container(
      width: 140,
      height: 210,
      color: Colors.grey.shade900,
      child: const Icon(Icons.broken_image, color: Colors.grey, size: 40),
    );
  }

  Widget _ratingBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            movieEntity.rating.toStringAsFixed(1),
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.star, color: Colors.grey, size: 16),
        ],
      ),
    );
  }
}
