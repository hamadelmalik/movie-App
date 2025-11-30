import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entity/action_entity.dart';

class ActionMoviesCard extends StatelessWidget {
  final ActionMovieEntity actionMovieEntity;

  const ActionMoviesCard({super.key, required this.actionMovieEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              actionMovieEntity.assetPath,
              width: 150,
              height: 200,
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
                    actionMovieEntity.rating.toString(),
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
